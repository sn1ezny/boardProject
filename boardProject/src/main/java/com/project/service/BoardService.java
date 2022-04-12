package com.project.service;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.PageDTO;

public interface BoardService {
	
	public void writeBoard(BoardDTO boardDTO);
	public Integer getMaxNum();
	public int getBoardCount();
	public BoardDTO getBoard(int num);
	public List<BoardDTO> getBoardList(PageDTO pageDTO);
	public void updateBoard(BoardDTO boardDTO);
	public void updateReadcount(int num);
	public void deleteBoard(int num);
	
}
