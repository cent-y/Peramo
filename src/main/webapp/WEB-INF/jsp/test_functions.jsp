<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Menu</title>
</head>
<body>
    <form action="/addBalance" method="post" accept-charset="utf-8">
                			Add Balance
                			<select name="type">
                				<option>Cash</option>
                				<option>Online Funds</option>
                			</select>
                			Category: <input type="text" name="category" id="category">
					   		Amount: <input type="text" name="amount" id="amount">
					        <button type="submit" id="confirmAdd">Add</button>
	</form>
	<form action="/deductBalance" method="post" accept-charset="utf-8">
                			Deduct Balance
                			<select name="type">
                				<option>Cash</option>
                				<option>Online Funds</option>
                			</select>
                			Category: <input type="text" name="category" id="category">
					   		Amount: <input type="text" name="amount" id="amount">
					        <button type="submit" id="confirmAdd">Deduct</button>
	</form>
	<form action="/transferBalance" method="post" accept-charset="utf-8">
                			Transfer Balance
                			<select name="cashflow">
                				<option>From cash to online funds</option>
                				<option>From online funds to cash</option>
                			</select>
					   		Amount: <input type="text" name="amount" id="amount">
					        <button type="submit" id="confirmAdd">Transfer</button>
	</form>
	
	<br>Cash Balance: <input value="<c:out value='${user.cash}'/>"/>
	<br>Online Funds Balance: <input value="<c:out value='${user.online_funds}'/>"/>
	
	<table border="1">
		<tr>
		<th>Date</th>
		<th>Amount</th>
		<th>Category</th>
		</tr>
		<c:forEach var="a" items="${listOfTxn}">
			<tr>
				<td>${a.txn_date}</td>
				<td>${a.amount}</td>
				<td>${a.category}</td>
			</tr>
		</c:forEach>
	</table>
    <form action="/addCashBalance" method="post">
                			Add Cash Balance
					        Amount: <input type="text" name="cash" id="cash">
					   
					        <button type="submit" id="confirmAdd">Add</button>
	</form>
	<form action="/addOnlineFundsBalance" method="post">
                			Add Online Funds Balance
					        Amount: <input type="text" name="online_funds" id="online_funds">
					   
					        <button type="submit" id="confirmAdd">Add</button>
	</form>
	<form action="/deductCashBalance" method="post">
                			Deduct Cash Balance
					        Amount: <input type="text" name="cash" id="cash">
					   
					        <button type="submit" id="confirmAdd">Deduct</button>
	</form>
	<form action="/deductOnlineFundsBalance" method="post">
                			Deduct Online Funds Balance
					        Amount: <input type="text" name="online_funds" id="online_funds">
					   
					        <button type="submit" id="confirmAdd">Deduct</button>
	</form>
</body>
</html>