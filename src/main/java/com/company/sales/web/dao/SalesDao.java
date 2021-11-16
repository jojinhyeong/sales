//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.company.sales.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao implements ISalesDao {
    @Autowired
    public SqlSession sqlSession;

    public SalesDao() {
    }

    public List<HashMap<String, String>> selectData(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectData", params);
    }

    public HashMap<String, String> loginData(HashMap<String, String> params) throws Throwable {
        return (HashMap)this.sqlSession.selectOne("login.loginData", params);
    }

    public List<HashMap<String, String>> selectOrder(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectOrder", params);
    }

    public List<HashMap<String, String>> selectPartner(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectPartner", params);
    }

    public List<HashMap<String, String>> selectApp2(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectApp2", params);
    }

    public List<HashMap<String, String>> selectYear(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectYear", params);
    }

    public List<HashMap<String, String>> selectCash(HashMap<String, String> params) throws Throwable {
        return this.sqlSession.selectList("list.selectCash", params);
    }
}
