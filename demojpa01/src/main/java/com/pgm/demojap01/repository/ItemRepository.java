package com.pgm.demojap01.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import com.pgm.demojap01.domain.Item;

public interface ItemRepository extends JpaRepository<Item, Long>, 
	QuerydslPredicateExecutor<Item> {

	//데이터 저장, list 조회, entity 1개 조회, 수정 , 삭제 작성하기
	
	List<Item> findByItemNm(String itemNm);

	List<Item> findByPriceLessThan(int i);

	List<Item> findByPriceLessThanOrderByPriceDesc(int price);

	List<Item> findByItemNmOrItemDetail(String string, String string2);

	List<Item> findByPriceGreaterThanEqual(int i);
	List<Item> findByPriceGreaterThan(int i);

//	@Query("select i from Item i where i.itemDetail like %:itemDetail% order by i.price desc")
//	List<Item> findByItemDetail(@Param("itemDetail") String itemDetail);
//
//	@Query(value="select * from item i where i.item_detail like %:itemDetail% order by i.price desc", nativeQuery = true)
//	List<Item> findByItemDetialNative(String string);
//	
	@Query(value="select * from item",nativeQuery=true)
	List<Item> getListAA();

	@Query("select i from Item i where i.itemDetail like"
			+ " %:itemDetail% order by i.price desc")
	List<Item> selectItemDetialNative(@Param("itemDetail")String itemDetail);
	

//	//@Query("select i from Item i where i.itemDetail like "
//	//		+ "%:itemDetail% order by i.price desc") 
//	List<Item> findByItemDetail(@Param("itemDetail") String itemDetail);
//	
//	@Query(value="select * from item i where i.item_detail like "
//			+ "%:itemDetail% order by i.price desc", nativeQuery=true) 
//	List<Item> findByItemDetailByNative(@Param("itemDetail") String itemDetail);


	

	
}
