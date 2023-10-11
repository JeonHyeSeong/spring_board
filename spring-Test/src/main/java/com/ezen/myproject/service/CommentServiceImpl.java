package com.ezen.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.myproject.domain.CommentVO;
import com.ezen.myproject.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{
	
	private CommentDAO cdao;

	@Autowired
	public CommentServiceImpl(CommentDAO cdao) {
		this.cdao = cdao;
	}

	@Override
	public int post(CommentVO cvo) {
		log.info("post check");
		return cdao.insert(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("list check");
		return cdao.getList(bno);
	}

	@Override
	public int edit(CommentVO cvo) {
		log.info("edit check");
		return cdao.update(cvo);
	}

	@Override
	public int remove(int cno) {
		log.info("remove check");
		return cdao.delete(cno);
	}
	
	
}
