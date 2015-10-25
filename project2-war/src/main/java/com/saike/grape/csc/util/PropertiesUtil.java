package com.saike.grape.csc.util;

import java.util.Locale;

/**
 * 资源属性接口
 */
public interface PropertiesUtil {

    String getMessage(String messageKey);

    String getMessage(String messageKey, String[] para);

    String getMessage(String messageKey, Locale locale);

    String getMessage(String messageKey, String[] para, Locale local);

}
