package com.saike.grape.csc.controller;

import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 保养券规则操作 控制层
 */
@Controller
@RequestMapping("/grape/couponManager")
public class CouponManagerController extends CSCBaseController {
    private static Logger logger = LoggerFactory
            .getLogger(CouponManagerController.class);

    /**
     * 跳到保养劵规则生成页面（coupon）
     */
    @RequestMapping(value = "/couponIndex")
    public String couponIndex(Model model, HttpServletRequest request) {
        logger.info("/couponIndex/0  跳到生成保养劵规则页面");
        return "grape/coupon.ftl";
    }

    /**
     * 跳到保养劵列表页面
     */

    @RequestMapping(value = "/showCouponList")
    public String showCouponList(Model model, HttpServletRequest request)
            throws Exception {
        return "grape/coupon.query.ftl";
    }

    /**
     * 获取保养劵规则
     */
    @RequestMapping("/getAllCoupon")
    public void getCouponList(@RequestBody Map<String, Object> params,
            PrintWriter printWriter) {
    }

    /**
     * 更新保养劵规则状态
     */
    @RequestMapping("/updateCouponStatus/0")
    @ResponseBody
    public void updateCouponStatus(@RequestBody Map<String, Object> params,
            PrintWriter printWriter) {
    }

    /**
     * 保存保养券规则
     */
    @RequestMapping("/creatCoupon/0")
    @ResponseBody
    public void creatCoupon(@RequestBody Map<String, Object> params,
            HttpServletResponse response) {
    }

    /**
     * 获取保养券列表
     */
    @RequestMapping("/getCouponListByPage/0")
    @ResponseBody
    public Object getCouponListByPage(@RequestBody Map<String, Object> params)
            throws ParseException {
        return null;
    }

}
