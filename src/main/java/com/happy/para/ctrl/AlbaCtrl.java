package com.happy.para.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.happy.para.dto.AlbaDto;
import com.happy.para.dto.OwnerDto;
import com.happy.para.dto.PagingDto;
import com.happy.para.model.Alba_IService;

@Controller
public class AlbaCtrl {

	@Autowired
	private Alba_IService alService;
	
	// 아르바이트 등록 폼으로 
	@RequestMapping(value="/albaRegiForm.do", method=RequestMethod.GET)
	public String albaRegiForm() {
		return "/alba/albaRegiForm";
	}
	
	// 아르바이트 등록
	@RequestMapping(value="/albaRegi.do", method=RequestMethod.POST)
	public String albaRegi(HttpSession session, AlbaDto albaDto) {
		OwnerDto ownDto = (OwnerDto) session.getAttribute("loginDto");
		String store_code = ownDto.getStore_code();
		albaDto.setStore_code(store_code);
		System.out.println("------------------------\n"+albaDto+"\n----------------------");
		alService.albaRegister(albaDto);
		
		return "redirect:/selAlbaList.do";
	}
	
	// 아르바이트 전체 조회
	@RequestMapping(value="/selAlbaList.do", method=RequestMethod.GET)
	public String selAlbaList(HttpSession session, Model model) {
		OwnerDto ownDto = (OwnerDto) session.getAttribute("loginDto");
		String store_code = ownDto.getStore_code();
		
		PagingDto pagingDto = new PagingDto();
		Map<String, String> albamap = new HashMap<String,String>();
		albamap.put("store_code", store_code);
		albamap.put("alba_delflag", "N");
		pagingDto.setTotal(alService.albaListRow(albamap));
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", pagingDto.getStart()+"");
		map.put("end", pagingDto.getEnd()+"");
		map.put("store_code", store_code);
		map.put("alba_delflag", "N");
		
		List<AlbaDto> albaList =  alService.albaList(map);
		model.addAttribute("albaList", albaList);
		model.addAttribute("albaRow", pagingDto);
		
		return "/alba/albaList";
	}
	
	// 아르바이트 삭제
	@RequestMapping(value="/delAlba.do", method=RequestMethod.POST)
	public String delAlba(String alba_seq) {
		System.out.println(alba_seq);
		
		alService.albaDelete(alba_seq);
		
		return "redirect:/selAlbaList.do";
	}
	
	
}
