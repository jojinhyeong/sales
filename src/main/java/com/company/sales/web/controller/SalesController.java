//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.company.sales.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.sales.web.service.ISalesService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class SalesController {
    @Autowired
    public ISalesService iSalesService;

    public SalesController() {
    }

    @RequestMapping({"/home"})
    public ModelAndView home(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
        int page = 1;
        if (params.get("page") != null) {
            page = Integer.parseInt((String)params.get("page"));
        }

        mav.addObject("page", page);
        mav.setViewName("sales/home");
        return mav;
    }

    @RequestMapping(
        value = {"ListAjax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String ListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> list = this.iSalesService.selectData(params);
        modelMap.put("list", list);
        return mapper.writeValueAsString(modelMap);
    }

    @RequestMapping(
        value = {"orderAjax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String orderAjax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> order = this.iSalesService.selectOrder(params);
        modelMap.put("order", order);
        return mapper.writeValueAsString(modelMap);
    }

    @RequestMapping(
        value = {"patnerAjax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String patnerAjax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> partner = this.iSalesService.selectPartner(params);
        modelMap.put("partner", partner);
        return mapper.writeValueAsString(modelMap);
    }

    @RequestMapping(
        value = {"app2Ajax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String app2Ajax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> App2 = this.iSalesService.selectApp2(params);
        modelMap.put("App2", App2);
        return mapper.writeValueAsString(modelMap);
    }

    @RequestMapping(
        value = {"yearAjax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String yearAjax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> year = this.iSalesService.selectYear(params);
        modelMap.put("year", year);
        return mapper.writeValueAsString(modelMap);
    }

    @RequestMapping(
        value = {"cashAjax"},
        method = {RequestMethod.POST},
        produces = {"text/json;charset=UTF-8"}
    )
    @ResponseBody
    public String cashAjax(@RequestParam HashMap<String, String> params) throws Throwable {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap();
        List<HashMap<String, String>> cash = this.iSalesService.selectCash(params);
        modelMap.put("cash", cash);
        return mapper.writeValueAsString(modelMap);
    }
}
