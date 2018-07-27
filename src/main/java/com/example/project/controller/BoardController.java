package com.example.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.BoardVO;
import com.example.project.service.BoardService;
@Controller    // ���� Ŭ������ ��Ʈ�ѷ� ��(bean)���� ���
@RequestMapping("/board/*")
public class BoardController {
    
    // �������� ���� => BoardServiceImpl ����
    // IoC �������� ����
    @Inject
    BoardService boardService;
    
    // 01. �Խñ� ���
    @RequestMapping("list.do")
    public ModelAndView list(@RequestParam(defaultValue="title")String searchOption,@RequestParam(defaultValue="")String key) {
        List<BoardVO> list = boardService.listAll(searchOption, key);
        int count=boardService.countArticle(searchOption, key);
        // ModelAndView - �𵨰� ��
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("list",list);
        map.put("count",count);
        map.put("searchOption",searchOption);
        map.put("keyword", key);
        
        mav.setViewName("board/list"); // �並 list.jsp�� ����
        mav.addObject("map", map); // �����͸� ����
        return mav; // list.jsp�� List�� ���޵ȴ�.
    }
    
    //02-1 �Խñ� �ۼ�
    @RequestMapping("write.do")
    public String write() {
    	return "board/write";
    }
    
    //02-2 �Խñ� �Է�
    @RequestMapping("insert.do")
    public String insert(@ModelAttribute BoardVO vo,HttpSession session) {
    	String writer=(String)session.getAttribute("userId");
    	vo.setWriter(writer);
    	
    	boardService.create(vo);
    	return "redirect:list.do";
    }
    
      
    
    //3. �󼼺���
    @RequestMapping("view.do")
    public ModelAndView view(@RequestParam int bno) {
    	boardService.increaseViewcnt(bno);
    	ModelAndView mav=new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto",boardService.read(bno));
    	return mav;
    }
    
    
    //4. ����
    @RequestMapping("update.do")
    public String update(@ModelAttribute BoardVO vo) {
    	boardService.update(vo);
    	return "redirect:list.do";
    }
    
    
    
    
    
    
    
    
    
    
    
    //5. ���� 
    @RequestMapping("delete.do")
    public String delete(@RequestParam int bno) {
    	boardService.delete(bno);
    	return "redirect:list.do";
    }
}