//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.company.sales.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.sales.web.dao.ISalesDao;

@Service
public class SalesService implements ISalesService {
    @Autowired
    public ISalesDao iCampDao;

    public SalesService() {
    }

    public List<HashMap<String, String>> selectData(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectData(params);
    }

    public HashMap<String, String> loginData(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.loginData(params);
    }

    public List<HashMap<String, String>> selectOrder(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectOrder(params);
    }

    public List<HashMap<String, String>> selectPartner(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectPartner(params);
    }

    public List<HashMap<String, String>> selectApp2(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectApp2(params);
    }

    public List<HashMap<String, String>> selectYear(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectYear(params);
    }

    public List<HashMap<String, String>> selectCash(HashMap<String, String> params) throws Throwable {
        return this.iCampDao.selectCash(params);
    }
}
