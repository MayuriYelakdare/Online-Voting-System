<%@ page import="java.sql.*" %>  



<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Mayuri1122@"); //create connection
	
	if(request.getParameter("btn_register")!=null  ) //check register button click event not null
	{
		String name,contact,email,password,admincode;
                
		admincode=request.getParameter("txt_admin");
		name=request.getParameter("txt_name"); //txt_name
		contact=request.getParameter("txt_contact"); //txt_contact
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
                
                pstmt=con.prepareStatement("select * from adminid where id=? "); //sql select query 
		pstmt.setString(1,admincode);
		
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
                
                pstmt=con.prepareStatement("select * from admin where adminid=? OR email=? "); //sql select query 
		pstmt.setString(1,admincode);
                pstmt.setString(2,email);
                
		
		
		ResultSet rst=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(!rst.next())
		{
                

                
		pstmt=con.prepareStatement("insert into admin(name,contact,email,password,adminid) values(?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,name);
		pstmt.setString(2,contact);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
                pstmt.setString(5,admincode);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

             
		con.close(); //close connection
                }
                else
                {
                request.setAttribute("errorMsg"," Already exist...! ");
                }
                
             }
             else
               {
                request.setAttribute("Msg","Invalid Admin Id...! ");
                }
               
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
	
		function validateform()
		{
                     var Code= /^[a-z A-Z 0-9]+$/; //pattern allowed alphabet a-z or A-Z 
			
                        var Name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var Contact= /^[0-9]{10,10}$/; //pattern allowed numeric 0-9
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&()<> charecter 
                        
		 var code1 = document.getElementById("admincode"); //textbox id name
           	
	    var name1 = document.getElementById("name"); //textbox id name
            var contact1 = document.getElementById("contact"); //textbox id contact
            var email1 = document.getElementById("email"); //textbox id email
            var password1 = document.getElementById("password"); //textbox id password
            
            if(!Code.test(code1.value) || code1.value=='') 
            {
				alert("Enter Admin Id alphanumeric only....!");
                code1.focus();
                code1.style.background = '#f08080';
                return false;                    
            }
			
			if(!Name.test(name1.value) || name1.value=='') 
            {
				alert("Enter name Alphabet Only....!");
                name1.focus();
                name1.style.background = '#f08080';
                return false;                    
            }
			if(!Contact.test(contact1.value) || contact1.value=='') 
            {
				alert(" Contact must be 10 digit and Numeric Only....!");
                contact1.focus();
                contact1.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email1.value) || email1.value=='') 
            {
				alert("Enter Valid Email....!");
                email1.focus();
                email1.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password1.value) || password1.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password1.focus();
                password1.style.background = '#f08080';
                return false;                    
            }
        }
        function clearall()
        {
            window.location.href="adminRegistration.jsp"
        }
        function increment()
        {
            _currentNumber++;
            return "C"+_currentNumber.ToString();
       
        }
   	
	</script>	
        <style>
            html{
    background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%);
}

.form-register{
    max-width: 1000px;
    width: 100%;
    margin: 0 auto;

    font: bold 14px sans-serif;
    text-align: center;
}

.form-register-with-email{
    position: relative;
    display: inline-block;
    vertical-align: top;
    margin-right: 30px;
    text-align: center;
}

.form-register-with-email .form-white-background{
    width: 570px;
    box-sizing: border-box;
    background-color: #ffffff;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
    padding: 60px 45px;
    margin-bottom: 35px;
}

.form-register-with-email .form-row{
    text-align: left;
    margin-bottom: 23px;
}

.form-register-with-email .form-title-row{
    text-align: center;
    margin-bottom: 50px;
}

.form-register-with-email h1{
    display: inline-block;
    box-sizing: border-box;
    color:  #4c565e;
    font-size: 24px;
    padding: 0 20px 15px;
    border-bottom: 2px solid #e74c3c;
    margin: 0;
}

.form-register-with-email .form-row > label span{
    display: inline-block;
    box-sizing: border-box;
    color:  #5f5f5f;
    width: 125px;
    text-align: right;
    padding-right: 25px;
}

.form-register-with-email input{
    color:  #5f5f5f;
    box-sizing: border-box;
    width: 230px;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 12px 18px;
    border: 1px solid #dbdbdb;
}

.form-register-with-email .form-checkbox input{
    margin-left: 128px;
    margin-right: 10px;
    width: auto;
    vertical-align: top;
}

.form-register-with-email .form-row .form-checkbox span{
    font-size: 12px;
    font-weight: normal;
    display: inline-block;
    text-align: left;
    width: 220px;
    margin: 0;
}

.form-register-with-email .form-checkbox span a{
    text-decoration: none;
    color:  #6caee0;
}

.form-register-with-email button{
    display: block;
    border-radius: 2px;
    background-color:  #6caee0;
    color: #ffffff;
    font-weight: bold;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 15px 35px;
    border: 0;
    margin: 55px auto 0;
    cursor: pointer;
}

.form-register-with-email .form-log-in-with-existing{
    text-decoration: none;
    padding: 15px 45px;
    font-weight: normal;
    color: blue;
    background-color: plum;
}
.form-register-with-email .form-log-in-with-existing1{
    text-decoration: none;
    padding: 15px 45px;
    font-weight: normal;
    color: blue;
    background-color: plum;
}

/*.form-register-with-email:after{
    content: 'OR';
    position: absolute;
    bottom: 330px;
    right: -100px;

    border-radius: 50%;
    background-color: #edeca5;
    width: 50px;
    height: 50px;
    color: #93923b;
    font-size: 17px;
    line-height: 50px;
}*/

.form-sign-in-with-social{
    display: inline-block;
    max-width: 180px;
    box-sizing: border-box;
    vertical-align: top;
    text-align: center;
    margin-top: 100px;
}

.form-sign-in-with-social .form-title-row{
    margin-bottom: 50px;
}

.form-sign-in-with-social .form-title{
    box-sizing: border-box;
    color:  #4c565e;
    font-size: 24px;
    padding: 15px 20px;
    border-bottom: 2px solid #6caee0;
}

.form-sign-in-with-social .form-google-button{
    color:  #ffffff;
    display: block;
    width: 145px;
    height: 40px;
    font-size: 12px;
    line-height: 40px;
    background-color:  rgba(222, 110, 60, 0.9);
    box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
    border-radius: 2px;
    margin: 8px auto;
    text-decoration: none;
}

.form-sign-in-with-social .form-facebook-button{
    color:  #ffffff;
    display: block;
    width: 145px;
    height: 40px;
    font-size: 12px;
    line-height: 40px;
    background-color:  rgba(75, 136, 194, 0.9);
    box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
    border-radius: 2px;
    margin: 8px auto;
    text-decoration: none;
}

.form-sign-in-with-social .form-twitter-button{
    color:  #ffffff;
    display: block;
    width: 145px;
    height: 40px;
    font-size: 12px;
    line-height: 40px;
    background-color:  rgba(123, 195, 226, 0.9);
    box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
    border-radius: 2px;
    margin: 8px auto;
    text-decoration: none;
}

/*	Making the form responsive. Remove these media queries
    if you don't need the form to work on mobile devices. */

@media (max-width: 900px) {

    .form-register{
        margin: 20px auto;
    }

    .form-register-with-email{
        position: relative;
        display: block;
        margin: 0;
    }

    .form-register-with-email .form-white-background{
        margin: 0 auto 32px;
    }

    .form-register-with-email:after{
        bottom: -80px;
        left: 50%;
        margin-left: -25px;
    }

    .form-sign-in-with-social {
        margin-top: 105px;
    }

}

@media (max-width: 600px) {

    .form-register-with-email .form-white-background{
        width: 300px;
        padding-left: 35px;
        padding-right: 35px;
    }

    .form-register-with-email .form-row > label span{
        display: block;
        text-align: left;
        padding: 0 0 10px;
    }

    .form-register-with-email input{
        display: block;
        margin: 0 auto;
    }

    .form-register-with-email .form-checkbox input{
        display: inline-block;
        margin-left: 0;
    }

    .form-register-with-email .form-checkbox span{
        width: 200px !important;
    }

    .form-register-with-email:after{
        bottom: -80px;
        left: 50%;
        margin-left: -25px;
    }



*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html{
	background-color: #efefef;
}

body{
	font:14px/1.5 Arial, Helvetica, sans-serif;
	margin:0;
}


header{
    box-sizing: border-box;
	text-align: center;
    width: 100%;
    padding: 25px 40px;
    background-color: #673AB7;
    overflow: hidden;
}


header h1{
    float: left;
	font: normal 24px/1.5 'Open Sans', sans-serif;
	color: #fff;
}

header a{
    color:#fff;
    float: right;
    text-decoration: none;
    display: inline-block;
    padding: 13px 50px;
    border-radius: 3px;
    font: bold 14px/1 'Open Sans', sans-serif;
    text-transform: uppercase;
    background-color:#F05283;

}

ul {
    list-style: none;
    border-bottom: 1px solid #EAEAEA;
    background-color: #A9A9A9;
    padding: 20px;
    margin-top: 0;
    text-align: center;
    margin-bottom: 75px;
}

ul a{
    text-decoration: none;
    color: #FFF;
    text-align: left;
    background-color: #e74c3c;
    padding: 10px 16px;
    border-radius: 2px;
    opacity: 0.8;
    font-size: 16px;
    display: inline-block;
    margin: 4px;
    line-height: 1;
    outline: none;

    transition: 0.2s ease;
}

ul li a.active{
    background-color: #e74c3c;
    pointer-events: none;
}

ul li a:hover {
    opacity: 1;
}


ul li{
    display: inline-block;
}


@media (max-width: 1000px) {


    header h1{
        float: none;
    }

    header a{
        margin-top: 25px;
        float: none;
    }

}

.main-content{
    margin-bottom: 75px;
}

/* -- Demo ads -- */

@media (max-width: 1200px) {
	#bsaHolder{ display:none;}
}

/* -- Link to Tutorialzine -- */

.tz-link{
	text-decoration: none;
	color: #fff !important;
	font: bold 36px Arial,Helvetica,sans-serif !important;
}

.tz-link span{
	color: #da431c;
}

        </style>	

</head>

<body>

   
    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validateform();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Admin Register</h1>
                    </div>
				   
					<p style="color:purple">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
                                        if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //register success message
					}
                                          if(request.getAttribute("Msg")!=null)
					{
						out.println(request.getAttribute("Msg")); //register success message
					}
					%>
					</p>
				   
				   </br>
                                   
                                   <div class="form-row">
                        <label>
                            <span>Admin Id</span>
                            <input type="text" name="txt_admin" id="admincode" placeholder="enter admin id">
                        </label>
                    </div>
		
				   
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
                                          <input style="background-color: red; color:white " type="button"  value="Clear All" onclick="return clearall();" >
					
                </div>
				
                <a href="adminLogin.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>
                <br> <br><br><br> <a href="homePage.jsp" class="form-log-in-with-existing1">Go to homePage </a>
               
            </div>
            
                    
				
            
            
            
            
               
                    
        </form>
                                       

    </div>

</body>

</html>