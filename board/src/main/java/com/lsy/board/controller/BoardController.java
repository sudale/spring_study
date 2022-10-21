package com.lsy.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lsy.board.model.Board;
import com.lsy.board.model.FileVO;
import com.lsy.board.model.User;
import com.lsy.board.service.BoardService;
import com.lsy.board.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	
	@Value("${spring.servlet.multipart.location}")
	String filePath;
	
	@GetMapping("register")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(Board board,MultipartFile[] uploads, HttpSession session) {
		log.info("board.............."+board.getWriter());
		
		log.info("board..............2"+board);
		
		User user=userService.findByUsername(board.getWriter());
		log.info("User.............."+user);
		
		String today=new SimpleDateFormat("yyMMdd").format(new Date());
		String saveFolder=filePath+File.separator+today;
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		for(MultipartFile multipartFile:uploads) {
			String originFile=multipartFile.getOriginalFilename();
			if(!originFile.isEmpty()) {
				FileVO fileVO = new FileVO();
				UUID uuid=UUID.randomUUID();
				String saveFileName=uuid.toString()+"_"+originFile;
				String fileType=multipartFile.getContentType();
				fileType=fileType.substring(0, fileType.indexOf("/"));
				fileVO.setFiletype(fileType);
				fileVO.setOriginfile(originFile);
				fileVO.setSavefile(saveFileName);
				fileVO.setSavefolder(today);
				try {
					File savefile=new File(saveFolder,saveFileName);
					multipartFile.transferTo(savefile);
					fileList.add(fileVO);
				}catch(IllegalStateException|IOException e) {
					e.printStackTrace();
				}
			}
		}
		board.setFiles(fileList);
		
		boardService.insert(board,user);
		return "redirect:/board/list";
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", boardService.findById(bno));
		model.addAttribute("filelist", boardService.fileList(bno));
		model.addAttribute("filePath", filePath);
		
		return "/board/detail";
	}
//	@GetMapping("list2")
//	public String list(Model model) {
////		model.addAttribute("list", boardService.boardList());
////		model.addAttribute("count", boardService.count());
//		return "/board/list2";
//	}
	
	//전체보기(페이징)
	@GetMapping("list")
	public String listPage(Model model, 
			@PageableDefault(size=5,sort="id", 
			direction=Sort.Direction.DESC) Pageable pageable) {
		
		Page<Board> lists=boardService.findAll(pageable);
		
		long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
		long rowNm=boardService.count(); // ex)102 -> 게시글 총수
		long totPage=(long)Math.ceil((double)rowNm/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
		long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
		System.out.println("CurrPag=============="+currPage);
		
		long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
		long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
		if(endPage>totPage) 
			endPage=totPage;
			
		boolean prev=startPage>0?true:false;  
		boolean next=endPage<totPage?true:false;
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage-1);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("count", rowNm);
		model.addAttribute("lists", lists);
		model.addAttribute("totPage", totPage);
		model.addAttribute("cp", currPage);
		
		return "board/list";
	}
	
	//검색 페이지 보기 
	   @GetMapping("search")
	   public String search(@RequestParam("word")String word, @RequestParam("field")String field,
			   Model model, @PageableDefault(size=5,sort="id", 
				direction=Sort.Direction.DESC) Pageable pageable) {       
		   Page<Board> searchList;
		   Page<Board> searchListWriter;
		   Page<Board> searchListContent;
		   Page<Board> searchListTitleWriterContent;
		   long rowNm;
		   if(field.equals("title")) {
				//먼저, 제목만 검색.
			   System.out.println("============title 검색.============");
			   System.out.println("============title 조건 걸림.============");
			   long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
			   searchList = boardService.search(word, pageable);   
				  System.out.println("============searchList null 이 아니면 조건 걸림.============");
				  
				  rowNm=searchList.getTotalElements();
					long totPage=(long)Math.ceil((double)rowNm/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
					long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
					System.out.println("CurrPag=============="+currPage);
					
					long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
					long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
					if(endPage>totPage) 
						endPage=totPage;
						
					boolean prev=startPage>0?true:false;  
					boolean next=endPage<totPage?true:false;
					
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("startPage", startPage);
					model.addAttribute("endPage", endPage-1);
					model.addAttribute("prev", prev);
					model.addAttribute("next", next);
					model.addAttribute("count", rowNm);
					model.addAttribute("lists", searchList);
					model.addAttribute("totPage", totPage);
					model.addAttribute("cp", currPage);
					model.addAttribute("word", word);
					model.addAttribute("field", field);
				   
			 
		   } else if (field.equals("writer")) {
			 //2. 작성자로 검색
			   System.out.println("============writer 검색.============");
			   long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
			   searchListWriter = boardService.searchWriter(word, pageable);
			   rowNm=searchListWriter.getTotalElements();
				long totPage=(long)Math.ceil((double)rowNm/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
				long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
				System.out.println("CurrPag=============="+currPage);
				
				long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
				long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
				if(endPage>totPage) 
					endPage=totPage;
					
				boolean prev=startPage>0?true:false;  
				boolean next=endPage<totPage?true:false;
				
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage-1);
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				model.addAttribute("count", rowNm);
				model.addAttribute("lists", searchListWriter);
				model.addAttribute("totPage", totPage);
				model.addAttribute("cp", currPage);
				model.addAttribute("word", word);
				model.addAttribute("field", field);
		   } else if (field.equals("content")) {
				 //3. 내용으로 검색
			   System.out.println("============content 검색.============");
			    long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
			    searchListContent = boardService.searchContent(word, pageable);			
				   rowNm=searchListContent.getTotalElements();
					long totPage=(long)Math.ceil((double)rowNm/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
					long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
					System.out.println("CurrPag=============="+currPage);
					
					long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
					long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
					if(endPage>totPage) 
						endPage=totPage;
						
					boolean prev=startPage>0?true:false;  
					boolean next=endPage<totPage?true:false;
					
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("startPage", startPage);
					model.addAttribute("endPage", endPage-1);
					model.addAttribute("prev", prev);
					model.addAttribute("next", next);
					model.addAttribute("count", rowNm);
					model.addAttribute("lists", searchListContent);
					model.addAttribute("totPage", totPage);
					model.addAttribute("cp", currPage);
					model.addAttribute("word", word);
					model.addAttribute("field", field);
		   } else if (field.equals("cwt")) {
				 //4. 제목 or 작성자 or 내용으로 검색
			   System.out.println("============제목 or 작성자 or 내용으로 검색 검색.============");
			    long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
				   searchListTitleWriterContent = boardService.searchListTitleWriterContent(word, pageable);
				   rowNm=searchListTitleWriterContent.getTotalElements();
					long totPage=(long)Math.ceil((double)rowNm/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
					long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
					System.out.println("CurrPag=============="+currPage);
					
					long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
					long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
					if(endPage>totPage) 
						endPage=totPage;
						
					boolean prev=startPage>0?true:false;  
					boolean next=endPage<totPage?true:false;
					
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("startPage", startPage);
					model.addAttribute("endPage", endPage-1);
					model.addAttribute("prev", prev);
					model.addAttribute("next", next);
					model.addAttribute("count", rowNm);
					model.addAttribute("lists", searchListTitleWriterContent);
					model.addAttribute("totPage", totPage);
					model.addAttribute("cp", currPage);
					model.addAttribute("word", word);
					model.addAttribute("field", field);
		   } else if(field == null){
			   System.out.println("============field == null 검색.============");
			   Page<Board> lists=boardService.findAll(pageable);
				
				long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
				long rowNm2=boardService.count(); // ex)102 -> 게시글 총수
				long totPage=(long)Math.ceil((double)rowNm2/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
				long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
				System.out.println("CurrPag=============="+currPage);
				
				long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
				long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
				if(endPage>totPage) 
					endPage=totPage;
					
				boolean prev=startPage>0?true:false;  
				boolean next=endPage<totPage?true:false;
				
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage-1);
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				model.addAttribute("count", rowNm2);
				model.addAttribute("lists", lists);
				model.addAttribute("totPage", totPage);
				model.addAttribute("cp", currPage);
		   }
		   
		   else {
			   System.out.println("============완전 else 검색.============");
			   Page<Board> lists=boardService.findAll(pageable);
				
				long pageSize=pageable.getPageSize(); //ex)5 -> 지정한 기본값: 5
				long rowNm2=boardService.count(); // ex)102 -> 게시글 총수
				long totPage=(long)Math.ceil((double)rowNm2/pageSize); //ex)21 -> 게시글 총수 / 페이지 기본값:5 : 올림
				long currPage=pageable.getPageNumber(); // 현재 페이지수 인덱스 형식으로 -> 1페이지 : 0, 21페이지 : 20
				System.out.println("CurrPag=============="+currPage);
				
				long startPage=((currPage)/pageSize)*pageSize; //ex)처음 0, 다음은 5 , 원래 페이지수 -1 , 순서:0,5,10,15...
				long endPage=startPage+pageSize;  //ex) 처음 5, 다음은 10, 인덱스 번호 형식, 순서: 5,10,15...
				if(endPage>totPage) 
					endPage=totPage;
					
				boolean prev=startPage>0?true:false;  
				boolean next=endPage<totPage?true:false;
				
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage-1);
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				model.addAttribute("count", rowNm2);
				model.addAttribute("lists", lists);
				model.addAttribute("totPage", totPage);
				model.addAttribute("cp", currPage);
		   }
			
//			long rowNm=boardService.count(); // ex)102 -> 게시글 총수
			
//			rowNm=rowNm_; // ex)102 -> 게시글 총수
			
		
			return "board/list";   //
	   }
	   
	
//	@GetMapping("detail/{id}")
//	public String detail(@PathVariable("id") Long id, Model model) {
//		model.addAttribute("board", boardService.findById(id));
//		return "/board/detail";
//	}
	

	
	/*
	@GetMapping({"detail/{id}","update/{id}"})
	public void view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("board", boardService.findById(id));
	}*/
	
	@GetMapping("update/{id}")
	public String update(@PathVariable("id") Long id, Model model) {
		model.addAttribute("board", boardService.findById(id));
		return "/board/update";
	}
	
	@PostMapping("update")
	public String update(Board board) {
		boardService.update(board);
		return "redirect:/board/list";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Long id) {
		boardService.delete(id);
		return "redirect:/board/list";
	}
	
	@GetMapping("download/{fno}")
	public void download(@PathVariable("fno") Long fno,
			HttpSession session,
			HttpServletResponse res, HttpServletRequest req) {
		
		FileVO fileVO=boardService.getFile(fno);
		String fileName=null;
		
		try {
			String path = filePath+File.separator+fileVO.getSavefolder();
			//실제경로에서 다운로드하기 위해서
			File file=new File(path, fileVO.getSavefile());
			//파일로부터 in으로 데이터를 가져오기
			BufferedInputStream in=
					new BufferedInputStream(new FileInputStream(file));
			//헤더정보가져오기
			String header=req.getHeader("User-Agent");
			//브라우저마다 인코딩이 다름
			if((header.contains("MSIE"))||(header.contains("Trident"))
					||(header.contains("Edge"))) {
			//인터넷 익스플로러 10이하 버전, 11버전, 엣지에서 인코딩
				fileName=URLEncoder.encode(fileVO.getOriginfile(),"UTF-8");
			}else {
			//나머지 브라우저에서 인코딩
				fileName = new String(fileVO.getOriginfile().getBytes("UTF-8"),"iso-8859-1");
			}
			res.setContentType("application/octet-stream");
			//다운로드와 다운로드될 파일 이름
			res.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
			//in에 있는 파일 복사
			FileCopyUtils.copy(in, res.getOutputStream());
			//닫고 출력스트림에서 남은 버퍼 flush한 후 닫기
			in.close();
			res.getOutputStream().flush();
			res.getOutputStream().close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
