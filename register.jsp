<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Mayuri1122@"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String name,contact,email,password;
		
		name=request.getParameter("txt_name"); //txt_firstname
		contact=request.getParameter("txt_contact"); //txt_contact
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into admin(name,contact,email,password) values(?,?,?,?)"); //sql insert query
		pstmt.setString(1,name);
		pstmt.setString(2,contact);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Register </title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var Name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var Contact= /^[0-9]+$/; //pattern allowed numeric 0-9
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var name = document.getElementById("name"); //textbox id name
            var contact = document.getElementById("contact"); //textbox id contact
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
			
			if(!Name.test(Name.value) || Name.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                name.focus();
                name.style.background = '#f08080';
                return false;                    
            }
			if(!Contact.test(lname.value) || contact.value=='') 
            {
				alert("Enter Contact Numeric Only....!");
                contact.focus();
                contact.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	
	

</head>

<body>

   
    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>Name</span>
                            <input type="text" name="txt_name" id="name" placeholder="enter name">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Contact</span>
                            <input type="text" name="txt_contact" id="contact" placeholder="enter Contact">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="enter password">
                        </label>
                    </div>

					<input style="background-color: red; color:white " type="submit" name="btn_register" value="Register">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
