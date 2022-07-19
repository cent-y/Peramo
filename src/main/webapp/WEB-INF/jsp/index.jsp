<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="testflexbox.css">
<!DOCTYPE html>
<html>
<body>

    <!--<div class="wrapper">
        <div class="box a">A</div>
        <div class="box b">B</div>
        <div class="box c">C</div>
        <div class="box d">
            <div class="box e">E</div>
            <div class="box f">F</div>
            <div class="box g">G</div>
        </div>
    </div>-->

    <div class="grid">
        <!--1st Column (Accounts) Start-->
        <div class="accounts">
            <p>Account Balance</p>
            <div class="accountWalletContainer">
                <div class="accountWalletLabel">
                    <ul>
                        <li>BDO</li>
                        <li>BPI</li>
                        <li>Cash</li>
                        <li>Gcash</li>
                    </ul>
                </div>
                <div class="accountWalletBalance">
                    <ul>
                        <li>Php 12345</li>
                        <li>Php 12345</li>
                        <li value="<c:out value='${user.fullname}'/>">Php 12345</li>
                        <li>Php 12345</li>
                    </ul>
                </div>
            </div>

            <button type="button">Make a transfer</button>

            <div id="addSubtractButtons">
                <button type="button" class="modifyFunds" id="addButton">+</button>
                <div id="addFunds">
                	<div class="modals">
                		<form action="/addCashBalance" method="post">
                			Add Funds
					        Amount: <input type="text" name="cash" id="cash">
					   
					        <button type="submit" id="confirmAdd">Add</button>
					    </form>
                	</div>
                </div>
                <button type="button" class="modifyFunds" id="subtractButton">-</button>
            </div>
        </div>
        <!--1st Column (Accounts) End-->

        <!--2nd Column (Expenses) Start-->
        <div class="expenses">
            <p>Expenses</p>
            <div class="chartAndLegendContainer">
                <div class="chart">
                    <div id="pieChart"></div>
                    <div id="dateLabel">Test Date</div>
                </div>

                <div class="legend">
                    <select class="dateSpanFilter">
                        <option value="" selected>Today</option>
                        <option>Last 7 days</option>
                        <option>Last 30 days</option>
                        <option>Last 365 days</option>
                        <option>All time</option>
                    </select>

                    <div class="categoriesLegend">
                    <ul>
                        <li>Transportation</li>
                        <li>Rent</li>
                        <li>Food</li>
                        <li>Entertainment</li>
                        <li>Bills</li>
                        <li>Clothing</li>
                        <li>Budol</li>
                    </ul>
                </div>
                </div>
            </div>
        </div>
        <!--2nd Column (Expenses) Start-->

        <!--3rd Column (Transaction History) Start-->
        <div class="txnHistory">
            <p>Transaction History</p>

            <table cellspacing="0" cellpadding="0" border="0" width="325">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="1" border="1" width="300" >
                            <tr style="color:white;background-color:grey">
                                <th>Date</th>
                                <th>Category</th>
                                <th>Amount</th>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width:320px; height:80px; overflow:auto;">
                            <table cellspacing="0" cellpadding="1" border="1" width="300" >
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                                <tr>
                                    <td>new item</td>
                                    <td>new item</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!--3rd Column (Transaction History) Start-->
    </div>

<script>
var modal = document.getElementById("addFunds");
var btn = document.getElementById("addButton");
var close = document.getElementsByClassName("confirmAdd")[0];

btn.onclick = function() {
	modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
close.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
</script>
</body>
</html>


