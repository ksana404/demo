package com.tedu.dao;

import java.util.List;
import com.tedu.pojo.Door;

public interface DoorMapper {
	/** 1、查询所有门店信息 */
	public List<Door> findAll();
	/** 2、新增门店信息 */
	public void add(Door door);
	/** 3、根据id删除门店信息 */
	public void deleteById( Integer id );
	/** 4、根据id修改门店信息 */
	public void updateById( Door door );
	
	/** 5、根据id查询门店信息 */
	public Door findById(Integer id);
	
}






