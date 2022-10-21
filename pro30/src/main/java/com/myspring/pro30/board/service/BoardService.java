package com.myspring.pro30.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.pro30.board.vo.ArticleVO;

public interface BoardService { // 인터페이스는 메서드들의 기능의 명세표(색인, 찾아보기)
	// 2. 의무성 이 기능은 반드시 구현을 해주세요.
	// 3. 단위 기능으로써 작업 구현이 용이하지만, 복잡도는 올라감, 유지보수 좋아짐. 공부는 어려워짐. 
	public List<ArticleVO> listArticles() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public ArticleVO viewArticle(int articleNO) throws Exception;
	//public Map viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
}
