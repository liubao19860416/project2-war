package com.saike.grape.csc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ibm.framework.uts.util.StringUtils;
import com.ibm.framework.web.controller.BaseController;
//import com.saic.ebiz.cms.exception.ImageIOException;
//import com.saic.ebiz.cms.service.api.IImageExtService;
//import com.saic.ebiz.cms.service.vo.Image;

import freemarker.ext.beans.BeansWrapper;

/**
 * CSC基类controller
 */
public class CSCBaseController extends BaseController {

    /**
     * 默认用户Id
     */
    public static final long DEFAULT_USER_ID = 44;

    /**
     * 会话的用户id
     */
    public static final String SESSION_USER_ID = "backuserid";

    /**
     * 日志
     */
    private static Logger logger = LoggerFactory
            .getLogger(CSCBaseController.class);

    /**
     * 请求
     */
    private HttpServletRequest request;

    /**
     * 响应
     */
    private HttpServletResponse response;

    /**
     * 会话
     */
    private HttpSession session;

    /**
     * 图片扩展service
     */
//    @Autowired
//    private IImageExtService imageExtService;

    /**
     * 设置请求响应值
     */
    @ModelAttribute
    public void setReqAndRes(HttpServletRequest request,
            HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.session = request.getSession();
        // ftl枚举支持
        this.request.setAttribute("enums", BeansWrapper.getDefaultInstance()
                .getEnumModels());
        this.request.setAttribute("statics", BeansWrapper.getDefaultInstance()
                .getStaticModels());
        this.request.setAttribute("requestURI", request.getRequestURI());
    }

    /**
     * 得到session中的用户ID
     */
    public String getUserId() {
        String userId = (String) session.getAttribute(SESSION_USER_ID);
        return StringUtils.isEmpty(userId) ? String.valueOf(DEFAULT_USER_ID)
                : userId;
    }

    /**
     * 发布图片
     */
    public void publishImg(Long imgId) throws Exception {
        if (imgId != null) {
            List<Long> imgs = new ArrayList<Long>();
            imgs.add(imgId);
            try {
                //imageExtService.publishImgs(imgs);
            } catch (Exception e) {
                logger.error("发布图片异常：" + e);
            }
        }
    }

    /**
     * 得到图片Url
     */
    public String getImageUrl(Long imgId) {
        List<Long> imgIds = new ArrayList<Long>();
        imgIds.add(imgId);
        //List<Image> imageList = null;//imageExtService.findImgs(imgIds);
//        if (imageList != null && imageList.size() > 0) {
//            return imageList.get(0).getPath();
//        }
        return null;
    }

    /**
     * @return the request
     */
    public HttpServletRequest getRequest() {
        return request;
    }

    /**
     * @return the response
     */
    public HttpServletResponse getResponse() {
        return response;
    }

    /**
     * @return the session
     */
    public HttpSession getSession() {
        return session;
    }

}
