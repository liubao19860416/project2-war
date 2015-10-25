package com.saike.grape.csc.util;

import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * 资源属性配置实现类
 */

//@Component("propertiesUtil")
public class PropertiesUtilImpl implements PropertiesUtil {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private MessageSource resources;

    @Resource(name = "resources")
    public void setResources(MessageSource resources) {
        this.resources = resources;
    }

    public String getMessage(String messageKey) {
        String message = "";
        try {
            message = this.resources.getMessage(messageKey, null, null);
        } catch (Exception e) {
            logger.error(ExceptionUtils.getFullStackTrace(e));
        }
        return message;
    }

    public String getMessage(String messageKey, String[] para) {

        String message = "";
        try {
            message = this.resources.getMessage(messageKey, para, null);
        } catch (Exception e) {
            logger.error(ExceptionUtils.getFullStackTrace(e));
        }
        return message;
    }

    public String getMessage(String messageKey, Locale locale) {
        String message = "";
        try {
            message = this.resources.getMessage(messageKey, null, locale);
        } catch (Exception e) {
            logger.error(ExceptionUtils.getFullStackTrace(e));
        }
        return message;
    }

    public String getMessage(String messageKey, String[] para, Locale locale) {
        String message = "";
        try {
            message = this.resources.getMessage(messageKey, para, locale);
        } catch (Exception e) {
            logger.error(ExceptionUtils.getFullStackTrace(e));
        }
        return message;
    }

}
