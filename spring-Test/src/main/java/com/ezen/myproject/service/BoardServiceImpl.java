package com.ezen.myproject.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.domain.PagingVO;
import com.ezen.myproject.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDAO bdao;
	
	@Autowired
	public BoardServiceImpl(BoardDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	public int register(BoardVO bvo) {
		log.info("register check 2");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("list check 2");
		return bdao.getList(pgvo);
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

	@Override
	public int getTotalCount(PagingVO pgvo) {
		
		return bdao.totalCount(pgvo);
	}

}
