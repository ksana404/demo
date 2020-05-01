<%@ page pageEncoding="utf-8"%>
<%-- 引入JSTL标签库 --%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>订单管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{ font-family: "微软雅黑"; background-color: #EDEDED; }
	h2{ text-align: center;}
	table{ width:96%; margin: 0 auto; text-align: center; border-collapse:collapse; font-size:16px;}
	td, th{ padding: 5px;}
	th{ background-color: #DCDCDC; width:120px; }
	th.width-40{ width: 40px; }
	th.width-50{ width: 50px; }
	th.width-64{ width: 64px; }
	th.width-80{ width: 80px; }
	th.width-120{ width: 100px; }
	hr{ margin-bottom:20px; border:1px solid #aaa; }
	#add-order{text-align:center;font-size:20px;}
</style>
	
<script type="text/javascript">
	
</script>
</head>
<body>
	<h2>订单管理</h2>
	<div id="add-order">
		<a href="toOrderAdd" target="rightFrame">新增订单</a>
		<!-- uel=toOrderAdd  跳转方式是右边新开跳转 -->
	</div>
	<hr/>
	<table border="1">
		<tr>
			<th class="width-40">序号</th>
			<th class="width-120">所属门店</th>
			<th class="width-50">订单号</th>
			<th class="width-40">类型</th>
			<th class="width-40">人数</th>
			<th class="width-50">收银员</th>
			<th class="width-120">下单时间</th>
			<th class="width-120">结账时间</th>
			<th class="width-50">支付方式</th>
			<th class="width-50">金额</th>
			<th class="width-80">操 作</th>
		</tr>

	<!-- 模版数据 -->
	<c:forEach items="${ list }"  var="order"  
									varStatus="st">
		<tr>
			<td>${ st.count }</td>
			<!-- 显示门店的名称：遍历所有门店的集合(doorList)
				将每一个门店对象中的id(door.id)和订单中记录的
				门店id(order.doorId)进行比较，如果二者相等，则
				将当前门店的名称显示在td中。
			 -->
			<td>
				<c:forEach items="${ doorList }" var="door">
					${ door.id == order.doorId ? door.name : "" }
				</c:forEach>
			</td>
			<td>${ order.orderNo }</td>
			<td>${ order.orderType }</td>
			<td>${ order.pnum }</td>
			<td>${ order.cashier }</td>
			<td>
				<fmt:formatDate value="${ order.orderTime }"
						pattern="yyyy/MM/dd HH:mm:ss"/>
			</td>
			<td>
				<fmt:formatDate value="${ order.payTime }"
						pattern="yyyy/MM/dd HH:mm:ss"/>
			</td>
			<td>${ order.payType }</td>
			<td>${ order.price }</td>
			<td>
				<a href="orderDelete?id=${ order.id }">删除</a>
				&nbsp;|&nbsp;
				<a href="orderInfo?id=${ order.id }">修改</a>
			</td>
		</tr>
	</c:forEach>
</table>

</body><!-- body-end  -->
</html>



