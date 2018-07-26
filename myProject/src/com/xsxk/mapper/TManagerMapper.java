package com.xsxk.mapper;

import com.xsxk.pojo.TManager;
import com.xsxk.pojo.TManagerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TManagerMapper {
    int countByExample(TManagerExample example);

    int deleteByExample(TManagerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TManager record);

    int insertSelective(TManager record);

    List<TManager> selectByExample(TManagerExample example);

    TManager selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TManager record, @Param("example") TManagerExample example);

    int updateByExample(@Param("record") TManager record, @Param("example") TManagerExample example);

    int updateByPrimaryKeySelective(TManager record);

    int updateByPrimaryKey(TManager record);
}