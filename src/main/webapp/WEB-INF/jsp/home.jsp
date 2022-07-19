<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.bodyFont {
	font-family: 'Poppins', sans-serif;
	background-image: radial-gradient(circle, white, #e8f4ff);
}

#txnHistory {
  background-color: #fcfcfc;
}

/*start transfer*/
.showTransfer-btn{
  background: #fff;
  padding: 10px 20px;
  font-size: 20px;
  font-weight: 500;
  color: #3498db;
  cursor: pointer;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}
.showTransfer-btn, .formTransfer-container{
  position: flex;
}

input[type="checkbox"]{
  display: none;
}

.formTransfer-container{
  display: none;
  background: #fff;
  width: 410px;
  padding: 30px;
  box-shadow: 0 0 8px rgba(0,0,0,0.1);
}
#showTransfer:checked ~ .formTransfer-container{
  display: block;
}
.formTransfer-container .close-btn{
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 18px;
  cursor: pointer;
}
.formTransfer-container .close-btn:hover{
  color: #3498db;
}
.formTransfer-container .text{
  font-size: 35px;
  font-weight: 600;
  text-align: center;
}

/*start add*/
.showAdd-btn{
  background: #fff;
  padding: 10px 20px;
  font-size: 20px;
  font-weight: 500;
  color: #3498db;
  cursor: pointer;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}
.showAdd-btn, .formAdd-container{
  position: flex;
}

input[type="checkbox"]{
  display: none;
}

.formAdd-container{
  display: none;
  background: #fff;
  width: 410px;
  padding: 30px;
  box-shadow: 0 0 8px rgba(0,0,0,0.1);
}
#showAdd:checked ~ .formAdd-container{
  display: block;
}
.formAdd-container .close-btn{
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 18px;
  cursor: pointer;
}
.formAdd-container .close-btn:hover{
  color: #3498db;
}
.formAdd-container .text{
  font-size: 35px;
  font-weight: 600;
  text-align: center;
}

/*start sub*/
.showSub-btn{
  background: #fff;
  padding: 10px 20px;
  font-size: 20px;
  font-weight: 500;
  color: #3498db;
  cursor: pointer;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}
.showSub-btn, .formSub-container{
  position: flex;
}

input[type="checkbox"]{
  display: none;
}

.formSub-container{
  display: none;
  background: #fff;
  width: 410px;
  padding: 30px;
  box-shadow: 0 0 8px rgba(0,0,0,0.1);
}
#showSub:checked ~ .formSub-container{
  display: block;
}
.formSub-container .close-btn{
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 18px;
  cursor: pointer;
}
.formSub-container .close-btn:hover{
  color: #3498db;
}
.formSub-container .text{
  font-size: 35px;
  font-weight: 600;
  text-align: center;
}

.dropDown {
  margin-bottom: 2%;
  padding: 1%;
  width: 100%;
  background-color: white;
  border: 1px solid grey;
  border-radius: 5px;
}

.confirmBtn {
  margin-bottom: 7%;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  padding: 2%;
  background-color: white;
  border: 1px solid grey;
  border-radius: 5px;
}

.amountInput {
  margin-bottom: 7%;
  padding: 1%;
  width: 100%;
  background-color: white;
  border: 1px solid grey;
  border-radius: 5px;
}

#confirmAdd:hover {
  background-color: blue;
  color: white;
}

#confirmTransfer:hover {
  background-color: green;
  color: white;
}

#confirmSub:hover {
  background-color: red;
  color: white;
}


</style>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet"> 
  <title>PERAMO</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <script 
  	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
  </script>
  
  <link rel="stylesheet" 
  	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  
</head>

<body class="bodyFont">
  <!--header-->
  <div class="container-fluid p-4 bg-primary text-white text-center">
    <h1>PERAMO</h1>
  <!--<p>Resize this responsive page to see the effect!</p>-->
  </div>

  <!--body-->
  <div class="container mt-2 ps-0">
    <div class="row">
      <div class="col-sm-3 shadow p-4 m-4 bg-white" style="height:100%;">
      <h5 class="mt-2">hello ${user.username}!</h5>
        <h3>CURRENT BALANCE</h3>
        <table class="table table-striped mt-4 mb-4">
          <tbody>
            <tr>
              <td>Cash</td>
              <td>${user.cash}</td>
            </tr>
            <tr>
              <td>Online Funds</td>
              <td>${user.online_funds}</td>
            </tr>
          </tbody>
        </table>

        <div class="row pb-5 mx-auto"> 
          <input type="checkbox" id="showTransfer">
          <label for="showTransfer" class="btn btn-outline-success btn-lg">TRANSFER</label>
          <div class="formTransfer-container">
            <form action="/transferBalance" method="post" accept-charset="utf-8">
              Transfer Balance
              <select name="cashflow" class="dropDown">
                <option>From cash to online funds</option>
                <option>From online funds to cash</option>
              </select>

              Amount: <input type="text" name="amount" id="amount" class="amountInput" pattern="[0-9]+">
              <button type="submit" id="confirmTransfer" class="confirmBtn">Transfer</button>
            </form>
          </div>
        </div>

        <div class="row pb-5 mx-auto"> 
          <input type="checkbox" id="showAdd">
          <label for="showAdd" class="btn btn-primary btn-lg mb-2">ADD MONEY</label>
          <div class="formAdd-container">
            <label for="showAdd" class="close-btn fas fa-times" title="close"></label>
            <form action="/addBalance" method="post" accept-charset="utf-8">
              Add Balance
              <select name="type" class="dropDown">
                <option>Cash</option>
                <option>Online Funds</option>
              </select>
      
              <br>Category:<br>
          
              <select name="category" class="dropDown">
                <option>Salary</option>
                <option>Commissions</option>
                <option>Investment Profits</option>
                <option>Business Profits</option>
                <option>Gift</option>
                <option>Others</option>
              </select>
              
              <br>Amount: <input type="text" name="amount" id="amount" class="amountInput" pattern="[0-9]+">
              <br><button type="submit" id="confirmAdd" class="confirmBtn">Add</button>
            </form>
          </div>

          <input type="checkbox" id="showSub">
          <label for="showSub" class="btn btn-danger btn-lg">DEDUCT MONEY</label>
          <div class="formSub-container">
            <label for="showSub" class="close-btn fas fa-times" title="close"></label>
            <form action="/deductBalance" method="post" accept-charset="utf-8">
              Deduct Balance
              <select name="type" class="dropDown">
                <option>Cash</option>
                <option>Online Funds</option>
              </select>
              
              Category: 
              <select name="category" class="dropDown">
                <option>Bills</option>
                <option>Food</option>
                <option>Transportation</option>
                <option>Leisure</option>
                <option>Health</option>
                <option>Others</option>
              </select>

              Amount: <input type="text" name="amount" id="amount" class="amountInput" pattern="[0-9]+">
              <br><button type="submit" id="confirmSub" class="confirmBtn">Deduct</button>
            </form>
          </div>
        </div>
        
        <div class="pt-5 mt-5">
          <form action="/logout" method="post" accept-charset="utf-8">
            <button type="submit" class="btn btn-outline-dark btn-lg col-12 align-bottom">LOGOUT</button>
          </form>	
        </div>
      </div>

    <div class="col-sm-8 p-5">
      <div class="row">
        <div class="col-sm-6">
          <h3>EXPENSES</h3>
          <ul class="list-group ps-2 mb-5">
            <li class="list-group-item list-group-item-success d-flex justify-content-between align-item-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                payments
              </i> Bills </span>
              <span>${bills}</span>
            </li>
            <li class="list-group-item list-group-item-warning d-flex justify-content-between align-items-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                fastfood
              </i>  Food </span>
              <span>${food}</span>
            </li>
            <li class="list-group-item list-group-item-primary d-flex justify-content-between align-items-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                local_taxi
              </i>  Transportation </span>
              <span>${transportation}</span>
            </li>
            <li class="list-group-item list-group-item-info d-flex justify-content-between align-items-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                diamond
              </i> Leisure </span>
              <span>${leisure}</span>
            </li>
            <li class="list-group-item list-group-item-danger d-flex justify-content-between align-items-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                health_and_safety
              </i> Health </span>
              <span>${health}</span>
            </li>
            <li class="list-group-item list-group-item-secondary d-flex justify-content-between align-items-center">
              <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                more_horiz
              </i> Others </span>
              <span>${others_out}</span>
            </li>
          </ul>
        </div>
        
        <div class="col-sm-6">
          <h3>INCOME</h3>
            <ul class="list-group ps-2 mb-5">
              <li class="list-group-item list-group-item-success d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  account_balance_wallet
                </i> Salary </span>
                <span>${salary}</span>
              </li>
              <li class="list-group-item list-group-item-warning d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  paid
                </i> Commissions </span>
                <span>${commissions}</span>
              </li>
              <li class="list-group-item list-group-item-primary d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  trending_up
                </i> Investment Profits </span>
                <span>${investment_profits}</span>
              </li>
              <li class="list-group-item list-group-item-info d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  bar_chart
                </i> Business Profits </span>
                <span>${business_profits}</span>
              </li>
              <li class="list-group-item list-group-item-danger d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  redeem
                </i> Gift </span>
                <span>${gift}</span>
              </li>
              <li class="list-group-item list-group-item-secondary d-flex justify-content-between align-items-center">
                <span class="d-flex align-items-center"> <i class="material-symbols-outlined me-3">
                  more_horiz
                </i> Others </span>
                <span>${others_in}</span>
              </li>
            </ul>
        </div>
      </div>

        <h3>TRANSACTION HISTORY</h3>
        <div style="width:100%; height:20%; overflow:auto;" id="txnHistory">
          <table class="table table-bordered" id="txnHistory">

            <thead>
              <tr>
                <th>Date</th>
                <th>Category</th>
                <th>Amount</th>
              </tr>
            </thead>

            <tbody>
              <c:forEach var="txn" items="${listOfTxn}">
                <tr>
                  <td>${txn.txn_date}</td>
                  <td>${txn.category}</td>
                  	<c:choose>
					    <c:when test="${txn.in_out=='in'}">
					        <td class="text-success">+ ${txn.amount}</td>
					    </c:when>    
					    <c:otherwise>
					        <td class="text-danger">- ${txn.amount}</td>
					    </c:otherwise>
					</c:choose>
                </tr>
              </c:forEach>
            </tbody>

          </table>
        </div>
      </div>
    </div>
  </div>

  <script>
  function openForm() {
    document.getElementById("myForm").style.display = "block";
  }

  function closeForm() {
    document.getElementById("myForm").style.display = "none";
  }
  
  </script>

</body>
</html>