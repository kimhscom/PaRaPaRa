package com.happy.para.model;

import java.util.List;
import java.util.Map;

import com.happy.para.dto.FileDto;
import com.happy.para.dto.MenuDto;

public interface Menu_IService {

	// 업주 선택 메뉴 조회
	public List<MenuDto> ownerMenuList(Map<String, Object> map);

	// 업주 메뉴 선택
	public boolean ownerMenuChoice(Map<String, String> map);

	// 전체 메뉴 조회
	public List<MenuDto> allMenu(MenuDto dto);

	//메뉴 상세 조회
	public MenuDto detailMenu(String menu_seq);
	
	// 담당자 메뉴 등록
	public boolean insertMenu(MenuDto dto);

	// 담당자 메뉴 이미지(파일) 등록
	public boolean insertMenuFile(FileDto dto);

	// 담당자 메뉴 수정
	public boolean modifyMenu(MenuDto dto);

	// 담당자 메뉴 이미지(파일) 수정
	public boolean modifyMenuFile(FileDto dto);

	// 담당자 메뉴 삭제
	public boolean deleteMenu(String menu_seq);
	
}
