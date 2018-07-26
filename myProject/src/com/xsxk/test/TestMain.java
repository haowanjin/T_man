package com.xsxk.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext-trans.xml");
        TestAOPServiceImpl service = (TestAOPServiceImpl) context.getBean("testAOPService");
        service.addUser();
	}
}
