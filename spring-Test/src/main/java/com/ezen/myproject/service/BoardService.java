package com.ezen.myproject.service;

import java.util.List;

import com.ezen.myproject.domain.BoardVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

}
