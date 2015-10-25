package com.saike.grape.csc.viewobject;

import java.io.Serializable;
/**
 * 返回的品牌信息列表
 * 
 * @author Liubao
 * @version 2.0
 */
public class BrandVO implements Serializable{
    private static final long serialVersionUID = 8281320714435512295L;
    
    private Long id;                      //id 
    private String velBrandId;            //code velBrandId
    private String velBrandChsName;       //品牌名称 velBrandChsName
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getVelBrandId() {
        return velBrandId;
    }
    public void setVelBrandId(String velBrandId) {
        this.velBrandId = velBrandId;
    }
    public String getVelBrandChsName() {
        return velBrandChsName;
    }
    public void setVelBrandChsName(String velBrandChsName) {
        this.velBrandChsName = velBrandChsName;
    }

}
