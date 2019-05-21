package com.happy.para.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.para.dto.TimeDto;

@Repository
public class Timesheet_DaoImpl implements Timesheet_IDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TimeDto> tsListAll() {
		return sqlSession.selectList("para.timesheet.tsListAll");
	}

	@Override
	public List<TimeDto> tsList(TimeDto dto) {
		return sqlSession.selectList("para.timesheet.tsList", dto);
	}

	@Override
	public boolean tsRegister(TimeDto dto) {
		int n = sqlSession.insert("para.timesheet.tsRegister", dto);
		return n>0?true:false;
	}

	@Override
	public boolean tsModify(TimeDto dto) {
		int n = sqlSession.update("para.timesheet.tsModify", dto);
		return n>0?true:false;
	}

	@Override
	public boolean tsDelete(TimeDto dto) {
		int n = sqlSession.delete("para.timesheet.tsDelete", dto);
		return n>0?true:false;
	}

}