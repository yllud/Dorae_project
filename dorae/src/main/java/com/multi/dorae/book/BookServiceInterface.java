package com.multi.dorae.book;

import java.util.List;

public interface BookServiceInterface {

	int insert(BookVO bag);

	int delete(BookVO bag);

	int count(String play_id);
	
	List<BookVO> mybook(String email);
	
}