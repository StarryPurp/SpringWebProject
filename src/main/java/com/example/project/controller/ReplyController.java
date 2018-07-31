package com.example.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.project.model.dto.ReplyVO;
import com.example.project.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyVO vo,HttpSession session) {
		String userId=(String)session.getAttribute("userId");
		vo.setReplyer(userId);
		replyService.create(vo);
	}
}
