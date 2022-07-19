<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-image: url("login_bg2.png");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.bodyFont {
	font-family: 'Poppins', sans-serif;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet"> 
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bodyFont">
    <form action="/validate" method="post">
          <section class="vh-100">
			  <div class="container py-5 h-100">
			    <div class="row d-flex justify-content-center align-items-center h-100">
			      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
			        <div class="card shadow p-4 m-4">
			          <div class="card-body p-5">
			
			            <h3 class="mb-5">Login</h3>
			
			            <div class="form-outline mb-4">
                   		 <label class="form-label" for="typeEmailX-2">Username</label>
			              <input type="text" name="username" class="form-control form-control-lg" />
			              
			            </div>
			
			            <div class="form-outline mb-2">
                    <label class="form-label" for="typePasswordX-2">Password</label>
			              <input type="password" name="password" class="form-control form-control-lg" />
			              <label class="form-label text-danger pt-2" for="typeEmailX-2">${error}</label>
			            </div>
		
			            <button class="btn btn-primary btn-lg" type="submit">Login</button>
			            
			            <div class="mt-2"><a href="/register" class="link-primary">Don't have an account? Register here</a></div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
		</section>
    </form>
    <script src="js/myScript.js"></script>
   
</body>
</html>
