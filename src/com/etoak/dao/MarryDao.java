package com.etoak.dao;

import com.etoak.po.Marry;

import java.util.List;

public interface MarryDao {
    public boolean addMarry(Marry marry);
    public List<Marry> queryMarry(String name, String time1, String time2, Integer index, Integer max);
    public Integer queryCount(String name,String time1,String time2);
    public boolean updateStatus(Integer id);
}
