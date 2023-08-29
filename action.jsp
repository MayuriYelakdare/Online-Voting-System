<%@ page import="java.sql.*" %>  



<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Mayuri1122@"); //create connection
	
	if(request.getParameter("btn_register")!=null  ) //check register button click event not null
	{
		String name,contact,batch,post,attendance,candidateid,Class;
                
		candidateid=request.getParameter("txt_id"); 
		name=request.getParameter("txt_name"); //txt_name
		contact=request.getParameter("txt_contact"); //txt_contact
		Class=request.getParameter("txt_class"); //txt_email
		batch=request.getParameter("txt_batch"); //txt_password
		attendance=request.getParameter("txt_attendance"); //txt_password
                post=request.getParameter("txt_post"); //txt_password
	
		PreparedStatement pstmt=null; //create statement
                 pstmt=con.prepareStatement("select * from candidate where id=? "); //sql select query 
		 pstmt.setString(1,candidateid);
		ResultSet rst=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(!rst.next())
		{
               
                
                 pstmt=con.prepareStatement("select * from candidate where  name=? AND class=? AND batch=? AND attendance=? AND post=? AND contact=? "); //sql select query 
		 
		pstmt.setString(1,name);
		pstmt.setString(2,Class);
		pstmt.setString(3,batch);
		pstmt.setString(4,attendance);
                pstmt.setString(5,post);
                pstmt.setString(6,contact);
		
               
		
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(!rs.next())
		{
               
		pstmt=con.prepareStatement("insert into candidate(id,Name,class,batch,Attendance,post,contact) values(?,?,?,?,?,?,?)"); //sql insert query
                pstmt.setString(1,candidateid);
		pstmt.setString(2,name);
		pstmt.setString(3,Class);
		pstmt.setString(4,batch);
		pstmt.setString(5,attendance);
                pstmt.setString(6,post);
                pstmt.setString(7,contact);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...!!!"); //register success messeage

                
		con.close(); //close connection
             }
                else
                 {
                request.setAttribute("errorMsg","Candidate Already exist...!");
                 }
	}
        else
         {
           request.setAttribute("Msg","Candidate ID Already exist...!");
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

	<title>Welcome : <%=session.getAttribute("login")%></title>

	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
        <style>
          
                   
      *{
  margin: 0;
  padding: 0;
  text-decoration: none;
}
:root {
  --accent-color: #fff;
  --gradient-color: #FBFBFB;
}
body{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
   width: 100vw;
  height: 100vh;
  background-image: linear-gradient(-45deg, #e3eefe 0%, #efddfb 100%);
}

.sidebar{
  position: fixed;
  width: 240px;
  left: -240px;
  height: 100%;
  background-color: #fff;
  transition: all .5s ease;
}
.sidebar header{
  font-size: 28px;
  color: #353535;
  line-height: 70px;
  text-align: center;
  background-color: #fff;
  user-select: none;
  font-family: 'Lato', sans-serif;
}
.sidebar a{
  display: block;
  height: 65px;
  width: 100%;
  color: #353535;
  line-height: 65px;
  padding-left: 30px;
  box-sizing: border-box;
  border-left: 5px solid transparent;
  font-family: 'Lato', sans-serif;
  transition: all .5s ease;
}
a.active,a:hover{
  border-left: 5px solid var(--accent-color);
  color: #fff;
   background: linear-gradient(to left, var(--accent-color), var(--gradient-color));
}
.sidebar a i{
  font-size: 23px;
  margin-right: 16px;
}
.sidebar a span{
  letter-spacing: 1px;
  text-transform: uppercase;
}
#check{
  display: none;
}
label #btn,label #cancel{
  position: absolute;
  left: 5px;
  cursor: pointer;
  color: #d6adff;
  border-radius: 5px;
  margin: 15px 30px;
  font-size: 29px;
  background-color: #e8d1ff;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
    inset -7px -7px 10px 0px rgba(0,0,0,.1),
   3.5px 3.5px 20px 0px rgba(0,0,0,.1),
   2px 2px 5px 0px rgba(0,0,0,.1);
  height: 45px;
  width: 45px;
  text-align: center;
  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);
  line-height: 45px;
  transition: all .5s ease;
}
label #cancel{
  opacity: 0;
  visibility: hidden;
}
#check:checked ~ .sidebar{
  left: 0;
}
#check:checked ~ label #btn{
  margin-left: 245px;
  opacity: 0;
  visibility: hidden;
}
#check:checked ~ label #cancel{
  margin-left: 245px;
  opacity: 1;
  visibility: visible;
}
@media(max-width : 860px){
  .sidebar{
    height: auto;
    width: 70px;
    left: 0;
    margin: 100px 0;
  }
  header,#btn,#cancel{
    display: none;
  }
  span{
    position: absolute;
    margin-left: 23px;
    opacity: 0;
    visibility: hidden;
  }
  .sidebar a{
    height: 60px;
  }
  .sidebar a i{
    margin-left: -10px;
  }
  a:hover {
    width: 200px;
    background: inherit;
  }
  .sidebar a:hover span{
    opacity: 1;
    visibility: visible;
  }
}

.sidebar > a.active,.sidebar > a:hover:nth-child(even) {
  --accent-color: #52d6f4;
  --gradient-color: #c1b1f7;
}
.sidebar a.active,.sidebar > a:hover:nth-child(odd) {
  --accent-color: #c1b1f7;
  --gradient-color: #A890FE;
}


.frame {
  width: 50%;
  height: 30%;
  margin: auto;
  text-align: center;
}

h2 {
  position: relative;
  text-align: center;
  color: #353535;
  font-size: 60px;
  font-family: 'Lato', sans-serif;
  margin: 0;
  color: #a759f5;
}

p {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  text-align: center;
  font-size: 30px;
  color: #d6adff;
  margin: 0;
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
    background-color: #d6f0c3;
}
.form-register-with-email .form-log-in-with-existing1{
    text-decoration: none;
    padding: 15px 45px;
    font-weight: normal;
    color: blue;
    background-color: #d6f0c3;
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
}

        </style>	

<script>	
	
		function validateform()
		{
                        var Candidate_Id= /^[0-9]+$/; //pattern allowed alphabet a-z or A-Z
                        var Name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var Contact= /^[0-9]{10,10}$/; //pattern allowed numeric 0-9
			var class_valid= /^[a-z A-Z]+$/; //pattern valid email validation
			var batch_valid=/^[a-z A-Z]+$/;
                        var attendance_valid= /^[0-9]+$/; //pattern allowed alphabet a-z or A-Z
                        var post= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z
                        
	    var candidateid1 = document.getElementById("id"); //textbox id name		
	    var name1 = document.getElementById("name"); //textbox id name
            var contact1 = document.getElementById("contact"); //textbox id contact
            var class1 = document.getElementById("class"); //textbox id email
            var batch1 = document.getElementById("batch"); //textbox id password
            var attendance1 = document.getElementById("attendance"); //textbox id name
             var post1 = document.getElementById("post"); //textbox id name
             
             if(!Candidate_Id.test(candidateid1.value) || candidateid1.value=='') 
            {
				alert("Enter Candidate Id Numeric Only....!");
                candidateid1.focus();
                candidateid1.style.background = '#f08080';
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
				alert(" Contact must be 10 digits and Numeric Only....!");
                contact1.focus();
                contact1.style.background = '#f08080';
                return false;                    
            }
            if(!attendance_valid.test(attendance1.value) || attendance1.value=='') 
            {
				alert(" Attendance can not be blank or less than 80%");
                attendance1.focus();
                attendance1.style.background = '#f08080';
                return false;                    
            }
			if(!class_valid.test(class1.value) || class1.value=='') 
            {
				alert("Select Class....!");
                class1.focus();
                class1.style.background = '#f08080';
                return false;                    
            }
            if(!batch_valid.test(batch1.value) || batch1.value=='') 
            {
				alert("Select batch....!");
                batch1.focus();
                batch1.style.background = '#f08080';
                return false;                    
            }
			
            if(!post.test(post1.value) || post1.value=='') 
            {
				alert("Select Post");
                post1.focus();
                post1.style.background = '#f08080';
                return false;                    
            }
        }
        function clearall()
        {
            window.location.href="action.jsp"
        }
      
        
   	</script>
        

</head>

<body>
     <input type="checkbox" id="check">
    <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
    </label>
    <div class="sidebar">
      <header>Menu</header>
      <a href="action.jsp" class="active">
        <i class="fas fa-qrcode"></i>
        <span>Add Candidate</span>
      </a>
      <a href="Result.jsp">
        <i class="fas fa-link"></i>
        <span>Result</span>
      </a>
     
      <a href="#">
        <i class="far fa-question-circle"></i>
        <span>Remove</span>
      </a>
      <a href="logOut.jsp">
        <i class="far fa-question-circle"></i>
        <span>logOut</span>
      </a>
    </div>
 
   <div class="main-content">

        <form class="form-register" method="post" action="action.jsp" onsubmit="return validateform();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Add candidate</h1>
                    </div>
				   
					<p style="color:green">				   		
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
                            <span>Candidate Id</span>
                            <input type="text" name="txt_id" id="id" placeholder="enter Candidate Id"  >
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
                            <input type="number"  name="txt_contact" id="contact" placeholder="enter Contact">
                        </label>
                    </div>
                         <div class="form-row">
                        <label>
                            <span>Attendance %</span>
                            <input type="number" min="80" max="100" name="txt_attendance" id="attendance" placeholder="enter Attendance">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Class</span>
                            
                        </label>
                        <select name="txt_class" id="class" >
                             <option value="">select class</option>
                            <option value="TYBCA">TYBCA</option>
                            <option value="TYBCS">TYBCS</option>
                            <option value="TYBT">TYBT</option>
                            <option value="TYBI">TYBI</option>
                        </select>
                    </div>
                                 <div class="form-row">
                        <label>
                            <span>Batch</span>
                            
                        </label>
                        <select name="txt_batch" id="batch">
                             <option value="">select batch</option>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                    </div>
                    


                     <div class="form-row">
                        <label>
                            <span>POST</span>
                            
                        </label>
                        <select name="txt_post" id="post">
                             <option value="">select post</option>
                            <option value="LR">LR</option>
                            <option value="Sports Secretary">Sports Secretary</option>
                            <option value="Cultural Secretary">Cultural Secretary</option>
                            <option value="GS">GS</option>
                        </select>
                    </div>

					<input style="background-color: red; color:white " type="submit" name="btn_register" value="Register" >
                                        <input style="background-color: red; color:white " type="button"  value="Add new" onclick="return clearall();" && >
					
                </div>
				
                
                
               
            </div>
            
                    
				
            
            
            
            
               
                    
        </form>
                                       

    </div>

    
    
</body>

</html>
