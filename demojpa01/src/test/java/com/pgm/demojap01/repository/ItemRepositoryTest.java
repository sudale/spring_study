package com.pgm.demojap01.repository;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;

import com.pgm.demojap01.constant.ItemSellStatus;
import com.pgm.demojap01.domain.Item;
import com.pgm.demojap01.domain.QItem;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

@SpringBootTest
@TestPropertySource(locations="classpath:application.properties")
public class ItemRepositoryTest {

	@Autowired
	ItemRepository itemRepository;
	
	@PersistenceContext
	EntityManager em;
	
	@Test
	@DisplayName("상품 Querydsl 조회 테스트")//BooleanExpression을 활용한 리팩토링
	public void queryDslTest() {
		//BooleanBuilder builder=new BooleanBuilder();
		JPAQueryFactory queryFactory=new JPAQueryFactory(em);
		QItem qitem=QItem.item;
		//select * from item
		JPAQuery<Item> query=queryFactory.selectFrom(qitem)
				.where(qitem.itemSellStatus.eq(ItemSellStatus.SELL)) //where item_sell_status='SELL'
				.where(qitem.itemDetail.like("%"+"테스트 상품 상세 설명"+"%"))
				.orderBy(qitem.price.desc());
		
		List<Item> items=query.fetch(); //ResultSet rs=query.execute()
		for(Item item : items){
            System.out.println(item.toString());
        }
	}
	
	@Test
    @DisplayName("상품 Querydsl 조회 테스트 2") //BooleanBuilder를 활용한 repository 메소드
    public void queryDslTest2(){
        BooleanBuilder booleanBuilder = new BooleanBuilder();
        QItem item = QItem.item;
        String itemDetail = "테스트 상품 상세 설명";
        int price = 10003;
        String itemSellStat = "SELL";

        booleanBuilder.and(item.itemDetail.like("%" + itemDetail + "%"));
        booleanBuilder.and(item.price.gt(price));
        System.out.println(ItemSellStatus.SELL);
        if(itemSellStat.equals(ItemSellStatus.SELL)){
            booleanBuilder.and(item.itemSellStatus.eq(ItemSellStatus.SELL));
        }

        Pageable pageable = PageRequest.of(0, 5);
        Page<Item> itemPagingResult = itemRepository.findAll(booleanBuilder, pageable);
        System.out.println("total elements : " + itemPagingResult. getTotalElements ());

        List<Item> resultItemList = itemPagingResult.getContent();
        for(Item resultItem: resultItemList){
            System.out.println(resultItem.toString());
        }
    }
	
	@Test
	@DisplayName("상픔 저장 테스트")
	public void createItemTest() {
		 Item item = new Item();
	     item.setItemNm("테스트 상품");
	     item.setPrice(10000);
	     item.setItemDetail("테스트 상품 상세 설명");
	     item.setItemSellStatus(ItemSellStatus.SELL);
	     item.setStockNumber(100);
	     item.setRegTime(LocalDateTime.now());
	     //item.setUpdateTime(LocalDateTime.now());
	     Item savedItem = itemRepository.save(item);
	     System.out.println(savedItem.toString());
	}
	
	@Test
	@DisplayName("상픔 저장 테스트2")
	public void createItemList(){
        for(int i=1;i<=10;i++){
            Item item = new Item();
            item.setItemNm("테스트 상품" + i);
            item.setPrice(10000 + i);
            item.setItemDetail("테스트 상품 상세 설명" + i);
            item.setItemSellStatus(ItemSellStatus.SELL);
            item.setStockNumber(100); 
            item.setRegTime(LocalDateTime.now());
            item.setUpdateTime(LocalDateTime.now());
            Item savedItem = itemRepository.save(item);
        }
    }
	
	@Test
    @DisplayName("상품명 조회 테스트")
    public void findByItemNmTest(){
        List<Item> itemList = itemRepository.findByItemNm("테스트 상품1");
        for(Item item : itemList){
            System.out.println(item);
        }
    }
	
	@Test
    @DisplayName("상품명, 상품상세설명 or 테스트")
    public void findByItemNmOrItemDetailTest(){
        List<Item> itemList = itemRepository
        		.findByItemNmOrItemDetail("테스트 상품1", "테스트 상품 상세 설명5");
        for(Item item : itemList){
            System.out.println(item.toString());
        }
    }
	
	@Test
    @DisplayName("가격 LessThan 테스트")
    public void findByPriceLessThanTest(){
        List<Item> itemList = itemRepository.findByPriceLessThan(10005);
        for(Item item : itemList){
            System.out.println(item.toString());
        }
    }
	
	@Test
    @DisplayName("가격 GreaterThan 테스트")
    public void findByPriceGraterThanTest(){
        List<Item> itemList = itemRepository.findByPriceGreaterThan(10005);
        for(Item item : itemList){
            System.out.println(item.toString());
        }
    }
	
	@Test
    @DisplayName("가격 GreaterThanEqual 테스트")
    public void findByPriceGraterThanEqualTest1(){
        List<Item> itemList = itemRepository.findByPriceGreaterThanEqual(10005);
        for(Item item : itemList){
            System.out.println(item.toString());
        }
    }
 
	@Test
    @DisplayName("가격 내림차순 조회 테스트")
    public void findByPriceLessThanOrderByPriceDesc(){
        List<Item> itemList = itemRepository.findByPriceLessThanOrderByPriceDesc(10005);
        for(Item item : itemList){
            System.out.println(item.toString());
        }
    }
	
//	@Test
//    @DisplayName("Query 조회 테스트")
//	public void queryTest() {
//		List<Item> items=itemRepository.findByItemDetail("테스트 상품");
//		for(Item item : items){
//            System.out.println(item.toString());
//        }
//	}
//	
//	@Test
//    @DisplayName("Query 조회 테스트")
//	public void queryNativeTest() {
//		List<Item> items=itemRepository.findByItemDetailByNative("테스트 상품");
//		for(Item item : items){
//            System.out.println(item.toString());
//        }
//	}
	
	@Test
    @DisplayName("Query 조회 테스트")
	public void queryNativeTest3() {
		List<Item> items=itemRepository.getListAA();
		for(Item item : items){
            System.out.println(item.toString());
        }
	}
	

}
