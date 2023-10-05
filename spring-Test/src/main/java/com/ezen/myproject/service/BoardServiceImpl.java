package com.ezen.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int register(BoardVO bvo) {
		log.info("register check 2");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("list check 2");
		return bdao.getList();
	}

	@Override
	public BoardVO getDetail(int bno) {
		log.info("detail check 2");
		// read_count + 1
		bdao.readCount(bno, 1);
		return bdao.getDetail(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		log.info("modify check 2");
		// read_count - 2
		bdao.readCount(bvo.getBno(), -2);
		return bdao.modify(bvo);
	}

	@Override
	public int remove(int bno) {
		log.info("remove check 2");
		return bdao.remove(bno);
	}

}
