package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.Formula;
import com.zzptc.twds.pojo.FormulaExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FormulaMapper {
   /* int countByExample(FormulaExample example);

    int deleteByExample(FormulaExample example);

   

    int insert(Formula record);

 
    List<Formula> selectByExample(FormulaExample example);

    Formula selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") Formula record, @Param("example") FormulaExample example);

    int updateByExample(@Param("record") Formula record, @Param("example") FormulaExample example);

    int updateByPrimaryKeySelective(Formula record);

    */
	
	List<Formula> selectAll();
	
	 int insertSelective(Formula record);
	 
	 Formula selectByFname(String fname);
	 
	 int deleteByPrimaryKey(Integer fid);
	 
	 int updateByPrimaryKey(Formula record);

	
}