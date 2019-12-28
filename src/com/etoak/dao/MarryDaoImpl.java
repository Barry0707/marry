package com.etoak.dao;

import com.etoak.factory.Factory;
import com.etoak.po.Marry;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.List;

public class MarryDaoImpl implements MarryDao{
    QueryRunner qr = new QueryRunner();
    @Override
    public boolean addMarry(Marry marry) {
        try{
            String sql = "insert into marry values(null,?,?,?,?,?,?,?,?,?)";
            return qr.update(Factory.getCon(),sql,marry.getMname(),marry.getMarea(),marry.getMtype(),marry.getMmoney(),marry.getMstyle(),marry.getMphone(),marry.getMwishtime(),marry.getMsettime(),marry.getMstatus())==1;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Marry> queryMarry(String name, String time1, String time2, Integer index, Integer max) {
        try{
            String sql = "select * from marry where 0=0 and";
            if(name!=""){
                sql+=" mname like '%"+name+"%' and";
            }
            if(time1!=""){
                sql+=" mwishtime > '"+time1+"' and";
            }
            if(time2!=""){
                sql+=" mwishtime < '"+time2+"' and";
            }
            sql = sql.substring(0,sql.length()-3);
            sql+="order by mid asc limit ?,?";
            return qr.query(Factory.getCon(),sql,new BeanListHandler<Marry>(Marry.class),index,max);

        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer queryCount(String name, String time1, String time2) {
        try{
            String sql="select count(*) from marry where 1=1 and";
            if(name!=""){
                sql+=" mname like '%"+name+"%' and";
            }
            if(time1!=""){
                sql+=" mwishtime > '"+time1+"' and";
            }
            if(time2!=""){
                sql+=" mwishtime < '"+time2+"' and";
            }
            sql = sql.substring(0,sql.length()-3);
            System.out.println(sql);
            return Integer.parseInt(qr.query(Factory.getCon(),sql,new ScalarHandler()).toString());
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean updateStatus(Integer id) {
        try{
            String sql = "update marry set mstatus = 1 where mid=?";
            return qr.update(Factory.getCon(),sql,id)==1;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
