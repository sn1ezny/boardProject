package com.project.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.BoardDAO;
import com.project.domain.BoardDTO;
import com.project.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void writeBoard(BoardDTO boardDTO) {
		boardDTO.setNum(getMaxNum()+1);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		boardDAO.writeBoard(boardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return boardDAO.getMaxNum();
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}

	@Override
	public BoardDTO getBoard(int num) {
		updateReadcount(num);
		return boardDAO.getBoard(num);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		
		int currentPage =	Integer.parseInt(pageDTO.getPageNum());
		int startRow 	= 	(currentPage-1) * pageDTO.getPageSize() + 1;
		int endRow		=	startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		pageDTO.setStartRow(startRow-1);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void updateReadcount(int num) {
		boardDAO.updateReadcount(num);
	}

	@Override
	public void deleteBoard(int num) {
		boardDAO.deleteBoard(num);
	}
	
}
