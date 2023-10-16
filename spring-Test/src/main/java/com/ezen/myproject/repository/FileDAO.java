package com.ezen.myproject.repository;

import java.util.List;

import com.ezen.myproject.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO fvo);

	List<FileVO> getFileList(int bno);

	int removeFile(String uuid);

}
