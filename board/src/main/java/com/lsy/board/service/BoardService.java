package com.lsy.board.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.lsy.board.model.Board;
import com.lsy.board.model.FileVO;
import com.lsy.board.model.Reply;
import com.lsy.board.model.User;

public interface BoardService {
	
	public void insert(Board board,User user);
	

	public void insertFileVO(FileVO fileVO);
	
	public List<Board> boardList();
	public List<FileVO> fileList(Long bno);
	public FileVO getFile(Long fno);
	
	public Board findById(Long id);
	
	public void update(Board board);
	public void delete(Long id);

	public Long count();
	
	public void insetReply(Reply reply);
	
	public List<Reply> replyList(Long bno);
	
	public void replyDelete(Long id);

	public Page<Board> findAll(Pageable pageable);
	
	//검색 제목
	public Page<Board> search(String word,Pageable pageable );
	
	//검색 작성자
		public Page<Board> searchWriter(String word,Pageable pageable );
		
		//검색 내용
		public Page<Board> searchContent(String word,Pageable pageable );
		
		 //4. 제목 or 작성자 or 내용으로 검색
		public Page<Board> searchListTitleWriterContent(  String word, Pageable pageable );

}
