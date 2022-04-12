package com.project.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.domain.BoardDTO;
import com.project.domain.PageDTO;
import com.project.service.BoardService;


@Controller
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(HttpServletRequest request, Model model) {
		
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		int count		= boardService.getBoardCount();
		int currentPage	= Integer.parseInt(pageNum);
		int pageBlock	= 5;
		int startPage	= (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage		= startPage + pageBlock - 1;
		int pageCount	= count / pageSize +  (count % pageSize == 0 ? 0 : 1);
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "board/board";
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		
		String num = request.getParameter("num");
		if (num == null) {
			num = "1";
		}
		int intNum = Integer.parseInt(num);
		BoardDTO boardDTO = boardService.getBoard(intNum);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "board/content";
	}
	
	@RequestMapping(value = "/writeContent", method = RequestMethod.GET)
	public String writeContent() {
		return "board/writeContent";
	}
	
//	@RequestMapping(value = "/writePro", method = RequestMethod.POST)
//	public String writePro(BoardDTO boardDTO) {
//		boardService.writeBoard(boardDTO);
//		return "redirect:/board";
//	}
	
	
	@RequestMapping(value = "/writePro", method = RequestMethod.POST)
	public String writePro(HttpServletRequest request, MultipartFile file) throws Exception {
		
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setMem_id(request.getParameter("mem_id"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		
		if (!file.isEmpty()) {
			UUID uid=UUID.randomUUID();
			String fileName=uid.toString()+"_"+file.getOriginalFilename();
			File uploadfile=new File(uploadPath,fileName);
			FileCopyUtils.copy(file.getBytes(), uploadfile);
			boardDTO.setFile(fileName);
		}
		

		boardService.writeBoard(boardDTO);
		
		return "redirect:/board";
		
	}
	
	@RequestMapping(value = "/updateContent", method = RequestMethod.GET)
	public String updateContent(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO boardDTO = boardService.getBoard(num);
		model.addAttribute("boardDTO", boardDTO);
		return "board/updateContent";
	}
	
	@RequestMapping(value = "/updateContentPro", method = RequestMethod.POST)
	public String updateContentPro(HttpServletRequest request, MultipartFile file) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setNum(num);
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		if (!file.isEmpty()) {
			UUID uid=UUID.randomUUID();
			String fileName=uid.toString()+"_"+file.getOriginalFilename();
			File uploadfile=new File(uploadPath,fileName);
			FileCopyUtils.copy(file.getBytes(), uploadfile);
			boardDTO.setFile(fileName);
		}
		
		boardService.updateBoard(boardDTO);
		
		return "redirect:/board";
	}
	
	@RequestMapping(value = "/deleteContent", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		boardService.deleteBoard(num);
		return "redirect:/board";
	}
	
}
