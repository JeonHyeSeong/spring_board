package com.ezen.myproject.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.myproject.domain.BoardDTO;
import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.domain.FileVO;
import com.ezen.myproject.domain.PagingVO;
import com.ezen.myproject.repository.BoardDAO;
import com.ezen.myproject.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDAO bdao;
	
	private FileDAO fdao;
	
	@Autowired
	public BoardServiceImpl(BoardDAO bdao, FileDAO fdao) {
		this.bdao = bdao;
		this.fdao = fdao;
	}

	@Override
	public int register(BoardDTO bdto) {
		log.info("register check 2");
		// 기존 게시글에 대한 내용을 DB에 저장 같은 내용을 저장
		int isOk = bdao.insert(bdto.getBvo());
		// ---파일 저장 라인---
		if(bdto.getFlist() == null) {
			// 파일의 값이 null이면 저장 없음.
			isOk *= 1; // 성공
		}else {
			// bvo에 값이 들어가고, 파일의 개수가 있다면...
			if(isOk > 0 && bdto.getFlist().size() > 0) {
				// fvo의 bno는 아직 설정되기 전.
				// 현재 시점에서 bno는 아직 결정되지 않음. => DB insert ai에 의해 자동생성
				int bno = bdao.selectBno(); // 방금 저장된 bno 가져오기
				// flist의 모든 FileVO에 방금 가져온 bno를 set
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					log.info(">>> fvo >> {}",fvo);
					// 파일 저장
					isOk *= fdao.insertFile(fvo);
				}
				
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("list check 2");
		bdao.commentcount();
		bdao.fileCount();
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

	@Override
	public BoardDTO getDetailFile(int bno) {
		// detail bvo, file 같이 가져오기
		bdao.readCount(bno, 1); // readCount 올리기
		BoardDTO bdto = new BoardDTO();
		bdto.setBvo(bdao.getDetail(bno)); // bdao bvo 호출
		bdto.setFlist(fdao.getFileList(bno));
		return bdto;
	}

	@Override
	public int removeFile(String uuid) {
		
		return fdao.removeFile(uuid);
	}

	@Override
	public int modifyFile(BoardDTO bdto) {
		bdao.readCount(bdto.getBvo().getBno(), -2);
		int isOk = bdao.modify(bdto.getBvo()); // 기존 bvo update
		if(bdto.getFlist() == null) {
			isOk *= 1;
		}else {
			if(isOk > 0 && bdto.getFlist().size() > 0) {
				int bno = bdto.getBvo().getBno();
				// 모든 fvo에 bno setting
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					isOk *= fdao.insertFile(fvo);
				}
			}
		}
		return isOk;
	}


	

}
