package com.ezen.myproject.service;

import com.ezen.myproject.domain.MemberVO;

public interface MemberService {

	int signup(MemberVO mvo);

	MemberVO isUser(MemberVO mvo);

	int modify(MemberVO mvo);

}
