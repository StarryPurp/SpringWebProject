package com.example.project.model.dao;

import java.util.List;

import com.example.project.model.dto.BoardVO;

public interface BoardDAO {
	
	//1. �Խñ� �ۼ�
	public void create(BoardVO vo);
	
	//2. �Խñ� �� ����
	public BoardVO read(int bno);
	
	//3. �Խñ� ����
	public void update(BoardVO vo);
	
	//4. �Խñ� ����
	public void delete(int bno);
	
	//5. �Խñ� ��ü ��Ϻ���
	public List<BoardVO> listAll(String searchOption,String key); 
	
	//6. �Խñ� ��ȸ�� ����
	public void increaseViewcnt(int bno);
	
	//7. �Խñ� ��ϼ�
	public int countArticle(String searchOption,String keyword);

}