package com.ezen.myproject;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTest {
	
	@Inject
	private BoardDAO bdao;
	
	@Test
	public void insertBoard() {
		log.info(">> Test Insert In >>");
		for(int i = 0; i < 300; i++) {
			BoardVO bvo = new BoardVO();
			bvo.setTitle("Test Title "+i);
			bvo.setWriter("Test Writer");
			bvo.setContent("Test Content "+i);
			
			bdao.insert(bvo);
		}
	}
}
