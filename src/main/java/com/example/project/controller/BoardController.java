package com.example.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.BoardVO;
import com.example.project.service.BoardService;
@Controller    // 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/board/*")
public class BoardController {
    
    // 의존관계 주입 => BoardServiceImpl 생성
    // IoC 의존관계 역전
    @Inject
    BoardService boardService;
    
    // 01. 게시글 목록
    @RequestMapping("list.do")
    public ModelAndView list(@RequestParam(defaultValue="title")String searchOption,@RequestParam(defaultValue="null")String key) {
        List<BoardVO> list = boardService.listAll(searchOption, key);
        int count=boardService.countArticle(searchOption, key);
        // ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("list",list);
        map.put("count",count);
        map.put("searchOption",searchOption);
        map.put("keyword", key);
        map.put("map", map);
        mav.setViewName("board/list"); // 뷰를 list.jsp로 설정
        mav.addObject("list", list); // 데이터를 저장
        return mav; // list.jsp로 List가 전달된다.
    }
    
    //02-1 게시글 작성
    @RequestMapping("write.do")
    public String write() {
    	return "board/write";
    }
    
    //02-2 게시글 입력
    @RequestMapping("insert.do")
    public String insert(@ModelAttribute BoardVO vo) {
    	boardService.create(vo);
    	return "redirect:list.do";
    }
    
      
    
    //3. 상세보기
    @RequestMapping("view.do")
    public ModelAndView view(@RequestParam int bno) {
    	boardService.increaseViewcnt(bno);
    	ModelAndView mav=new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto",boardService.read(bno));
    	return mav;
    }
    
    
    //4. 수정
    @RequestMapping("update.do")
    public String update(@ModelAttribute BoardVO vo) {
    	boardService.update(vo);
    	return "redirect:list.do";
    }
    
    
    
    
    
    
    
    
    
    
    
    //5. 삭제 
    @RequestMapping("delete.do")
    public String delete(@RequestParam int bno) {
    	boardService.delete(bno);
    	return "redirect:list.do";
    }
}