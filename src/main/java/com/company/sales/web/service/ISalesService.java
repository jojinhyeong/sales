//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.company.sales.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ISalesService {
    List<HashMap<String, String>> selectData(HashMap<String, String> var1) throws Throwable;

    HashMap<String, String> loginData(HashMap<String, String> var1) throws Throwable;

    List<HashMap<String, String>> selectOrder(HashMap<String, String> var1) throws Throwable;

    List<HashMap<String, String>> selectPartner(HashMap<String, String> var1) throws Throwable;

    List<HashMap<String, String>> selectApp2(HashMap<String, String> var1) throws Throwable;

    List<HashMap<String, String>> selectYear(HashMap<String, String> var1) throws Throwable;

    List<HashMap<String, String>> selectCash(HashMap<String, String> var1) throws Throwable;
}
