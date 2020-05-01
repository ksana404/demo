package com.tedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tedu.dao.DoorMapper;
import com.tedu.dao.OrderMapper;
import com.tedu.pojo.Door;
import com.tedu.pojo.Order;

@Controller
public class OrderController {
	@Autowired
	OrderMapper dao;
	@Autowired
	DoorMapper doorMapper;
	
	/** 1、查询所有订单信息 */
	@RequestMapping("/orderList")
	public String orderList( Model model ) {
		//查询所有订单集合，并将订单集合存入Model中
		List<Order> list = dao.findAll();
		model.addAttribute( "list", list );
		//查询所有门店集合, 并将门店集合存入Model中
		List<Door> doorList = doorMapper.findAll();
		model.addAttribute( "doorList", doorList );
		//将所有订单集合带到订单列表页面,取出进行显示
		return "order_list";
	}
	
	/** 2、查询所有门店信息，并将所有门店带到订单新增
	 * 		页面进行显示 */
	@RequestMapping("/toOrderAdd")
	public String toOrderAdd( Model model ) {
		//查询所有门店集合, 并将门店集合存入Model中
		List<Door> doorList = doorMapper.findAll();
		model.addAttribute( "doorList", doorList );
		return "order_add";
	}
	/** 3、新增订单信息 */
	@RequestMapping("/orderAdd")
	public String orderAdd( Order order ) {
		//调用新增订单的方法
		dao.add( order );
		//跳转到订单列表页面，显示最新订单信息
		return "forward:/orderList";
	}
	/** 4、根据id删除订单信息 */
	@RequestMapping("/orderDelete")
	public String orderDelete( Integer id ) {
		dao.deleteById( id );
		return "forward:/orderList";
	}
	/** 5、根据id查询订单信息 */
	@RequestMapping("/orderInfo")
	public String orderInfo( Integer id, Model model ) {
		//根据id查询订单信息
		Order order = dao.findById( id );
		model.addAttribute( "order", order );
		//查询所有门店集合,将门店集合存入Model中
		List<Door> doorList = doorMapper.findAll();
		model.addAttribute( "doorList", doorList );
		return "order_update";
	}
	
	/** 6、根据id修改门店信息 */
	@RequestMapping("/orderUpdate")
	public String orderUpdate( Order order ) {
		dao.updateById( order );
		return "forward:/orderList";
	}
	
	
}



