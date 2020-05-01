package com.tedu.pojo;
/**
 * POJO: 简单java对象
 * 	实体类: 用于封装数据
 */
public class Door {
	private Integer id;
	private String name;
	private String tel;
	private String addr;
	//get和set方法
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	//toString方法
	@Override
	public String toString() {
		return "Door [id=" + id + ", name=" + name + ", tel=" + tel + ", addr=" + addr + "]";
	}
}





