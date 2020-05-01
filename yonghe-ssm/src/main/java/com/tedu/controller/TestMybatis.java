package com.tedu.controller;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.tedu.dao.DoorMapper;
import com.tedu.pojo.Door;

/**
 * 测试mybatis的运行环境
 */
public class TestMybatis {
	/**
	 * 查询所有门店信息  List<Door>
	 * Door类
	 * @throws Exception 
	 */
	@Test
	public void testFindAll() throws Exception {
		//1.读取mybatis核心配置文件
		InputStream in = Resources.getResourceAsStream(
				"mybatis/mybatis-config.xml");
		//2.通过配置信息获取SqlSessionFactory对象
		SqlSessionFactory fac = 
				new SqlSessionFactoryBuilder().build( in );
		//3.根据工厂获取一个SqlSession对象
		SqlSession session = fac.openSession();
		//4.(Mapper接口开发)获取DoorMapper接口的子类实例
		DoorMapper mapper = 
				session.getMapper( DoorMapper.class );
		//5.调用findAll方法查询所有门店信息
		List<Door> list = mapper.findAll();
		for (Door door : list) {
			System.out.println( door );
		}
	}
}







