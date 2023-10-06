package com.ezen.myproject.repository;

import com.ezen.myproject.domain.MemberVO;

public interface MemberDAO {

	int signup(MemberVO mvo);

	MemberVO getUser(String id);

	int update(MemberVO mvo);

}
