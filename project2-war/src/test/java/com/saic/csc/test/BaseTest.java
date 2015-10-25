package com.saic.csc.test;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

/**
 */
@ContextConfiguration(locations = { "classpath:conf/spring/spring-servlet-test.xml" })
public abstract class BaseTest extends AbstractTestNGSpringContextTests {

}
