package com.lsy.board.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.lsy.board.model.Board;
import com.lsy.board.model.FileVO;
import com.lsy.board.model.Reply;
import com.lsy.board.model.User;
import com.lsy.board.repository.BoardRepository;
import com.lsy.board.repository.FileVORepository;
import com.lsy.board.repository.ReplyRepository;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private FileVORepository fileVORepository;
	
	
	@PersistenceContext
	EntityManager em;


	@Transactional
	@Override
	public void insert(Board board, User user) {
		// TODO Auto-generated method stub
		board.setUser(user);
		
		for(FileVO fileVO:board.getFiles()) {
			fileVO.setBno(boardRepository.getMaxBoardId()+1);
			fileVORepository.save(fileVO);
		}
		boardRepository.save(board);
	}

	@Override
	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return boardRepository.findAll();
	}
	
	@Override
	public List<Reply> replyList(Long bno) {
		// TODO Auto-generated method stub
		
		return replyRepository.replyList(bno);
	}
	
//상세화면 파일 보여주기 작업중
	@Override
	public List<FileVO> fileList(Long bno) {
		// TODO Auto-generated method stub
		return fileVORepository.findByBno(bno);
	}
	
//다운로드 작업중
	@Override
	public FileVO getFile(Long fno) {
		// TODO Auto-generated method stub
		return fileVORepository.findByFno(fno);
	}

	
	@Override
	public Page<Board> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return boardRepository.findAll(pageable);
	}
	
	//검색 :제목 
	@Transactional
	@Override
	public Page<Board> search( String word, Pageable pageable) {
		Page<Board>  boardEntities   = boardRepository.findByTitleContaining(word, pageable);
//			if(boardEntities.isEmpty()) {
////				return boardRepository.findAllByUseYn(PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "boardIdx")), "Y");
//				
//				
//			}
		return boardEntities;
	}
	
	//검색 :작성자
		@Transactional
		@Override
		public Page<Board> searchWriter( String word, Pageable pageable) {
		
			return boardRepository.findByWriterContaining(word, pageable);
		}
		
		//검색 :내용
				@Transactional
				@Override
				public Page<Board> searchContent( String word, Pageable pageable) {
				
					return boardRepository.findByContentContaining(word, pageable);
				}
		
		 //3. 제목 or 작성자 or 내용으로 검색
		@Transactional
		@Override
		public Page<Board> searchListTitleWriterContent( String word, Pageable pageable) {
		String title = word;
		String writer = word;
		String content = word;
			return boardRepository.findByTitleContainingOrWriterContainingOrContentContaining(title, writer, content, pageable);
//			return boardRepository.findByTitleOrWriterOrContent(title, writer, content, pageable);
		}

	@Transactional
	@Override
	public Board findById(Long id) {
		// TODO Auto-generated method stub
		Board board=boardRepository.findById(id).get();
		board.setHitcount(board.getHitcount()+1);
		return board;
	}

	@Transactional
	@Override
	public void update(Board board) {
		// TODO Auto-generated method stub
		//boardRepository.save(board);
		// 더티 체킹
		Board b=boardRepository.findById(board.getId()).get();
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		boardRepository.deleteById(id);
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return boardRepository.count();
	}

	@Override
	public void insetReply(Reply reply) {
		replyRepository.save(reply);
		// TODO Auto-generated method stub
		//replyRepository.replyInsert(
		//		reply.getWriter(), 
		//		reply.getContent(), 
		//		reply.getBoard().getId(), 
		//		reply.getUser().getId());
	}

	@Override
	public void insertFileVO(FileVO fileVO) {
		// TODO Auto-generated method stub
		fileVORepository.save(fileVO);
	}


	@Override
	public void replyDelete(Long id) {
		// TODO Auto-generated method stub
		replyRepository.deleteById(id);
	}



	
}
