<%@ page pageEncoding="utf-8"%>
<%-- 引入JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>修改订单</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{ font-family: "微软雅黑"; background-color: #EDEDED; }
	h2{ text-align: center;font-size:26px; }
	table{ margin: 30px auto; text-align: center; border-collapse:collapse; width:50%; }
	td, th{ padding: 5px;font-size:18px;}
	hr{ margin-bottom:20px; border:1px solid #aaa; }
	input,select,textarea{ width:284px; height:30px; background:#EDEDED; border:1px solid #999; text-indent:5px; font-size:18px; }
	input[type='submit']{ width:130px; height:36px; cursor:pointer; border-radius:5px 5px 5px 5px; background:#ddd; }
	select{text-indent:0px;}
	textarea{height:100px;font-size:22px;}
</style>
</head>
<body><!-- body-start  -->

<h2>修改订单</h2>
<hr/>
<form action="orderUpdate" method="POST">
	<!-- hidden隐藏域,在提交表单时连order.id一起提交 -->
	<input type="hidden" name="id" value="${ order.id }"/>
	<table border="1">
		<tr>
			<td width="30%">所属门店</td>
			<td>
				<select id="doorId" name="doorId">
					<!-- 
						将订单中记录的门店编号(order.doorId)和每一个
						option中门店的编号(door.id)进行比较, 如果两者
						相等, 就将当前门店所在的option设置为默认被
						选中(在option上添加一个selected属性即可)
					 -->
					<c:forEach items="${ doorList }" var="door">
						<option 
							<c:if test="${ door.id == order.doorId }">
								selected="selected"
							</c:if>
						 value="${ door.id }">${ door.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>订单编号</td>
			<td>
				<input type="text" name="orderNo" 
						value="${ order.orderNo }"/>
			</td>
		</tr>
		<tr>
			<td>订单类型</td>
			<td>
				<input type="text" name="orderType" 
						value="${ order.orderType }"/>
			</td>
		</tr>
		<tr>
			<td>用餐人数</td>
			<td>
				<input type="text" name="pnum" 
						value="${ order.pnum }"/>
			</td>
		</tr>
		<tr>
			<td>收银员</td>
			<td>
				<input type="text" name="cashier" 
						value="${ order.cashier }"/>
			</td>
		</tr>
		<tr>
			<td>下单时间</td>
			<td>
				<input type="text" name="orderTime" 
						value='<fmt:formatDate 
					value="${ order.orderTime }"
					pattern="yyyy/MM/dd HH:mm:ss"/>'/>
			</td>
		</tr>
		<tr>
			<td>结账时间</td>
			<td>
				<input type="text" name="payTime" 
						value='<fmt:formatDate 
					value="${ order.payTime }"
					pattern="yyyy/MM/dd HH:mm:ss"/>'/>
			</td>
		</tr>
		<tr>
			<td>支付方式</td>
			<td>
				<input type="text" name="payType"
						value="${ order.payType }"/>
				
			</td>
		</tr>
		<tr>
			<td>支付金额</td>
			<td>
				<input type="text" name="price"
						value="${ order.price }" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="提 	交"/>
			</td>
		</tr>
	</table>
</form>

</body><!-- body-end  -->
</html>



