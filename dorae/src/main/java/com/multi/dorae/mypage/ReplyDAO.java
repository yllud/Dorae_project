package com.multi.dorae.mypage;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//테이블 하나당 DAO하나! ==> CUD를 완성!! 
@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;

	public ReplyVO one(int email) {
		System.out.println("-----" + my);
		ReplyVO bag = my.selectOne("reply.one", email);
		return bag;

	}

	public int delete(int r_number) {
		System.out.println("------" + my);
		int result = my.delete("reply.delete", r_number);
		return result;
	}

	public int update(ReplyVO bag) {
		System.out.println("------" + my);
		int result = my.update("reply.update", bag);
		return result;
	}

//	// public void add2() {
//	public int insert(BbsVO bag) {
//		System.out.println("----" + my);
//		int result = my.insert("reply.create", bag);
//		return result;
//	}
	
	public int insert(ReplyVO bag) {
		System.out.println("----" + my);
		
		// 대한민국 시간대로 설정
	    ZoneId zoneId = ZoneId.of("Asia/Seoul");

	    // 대한민국 시간대로 현재 날짜와 시간 가져오기
	    ZonedDateTime currentDateTime = ZonedDateTime.now(zoneId);

	    // upload_date 필드에 현재 날짜와 시간 설정
	    bag.setUpload_date(Timestamp.valueOf(currentDateTime.toLocalDateTime()));

	    int result = my.insert("reply.create", bag);
	    return result;
	}
	
	 public List<ReplyVO> list() {
	        System.out.println("------" + my);
	        List<ReplyVO> list = my.selectList("reply.list");
	        return list;
	    }
	
	
}