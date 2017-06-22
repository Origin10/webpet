<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="author" content=""> -->

    <title>PetFriend</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

<!--     Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

</head>

<style>
	.dropdown-menu {
    width: 320px ;
    height: 100px ;
    font-size: 17px;
    font-family: sans-serif;
}

.navbar-default {
    background-color: #499975;
    border-color: #499975;
}

.navbar-default .navbar-nav > li > a {
    color: #f8f8f8;
}
.navbar-brand>img {
   max-height: 100%;
   height: 100%;
   width: auto;
   margin: 0 ;
}
 .navbar-brand { 
   background: url(imgs/pf2update2.png) center / contain no-repeat; 
   width: 250px; 
 } 

.profile-image {
    padding-top: 0;
    padding-bottom: 0;
}

</style>



<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
        <div class="container ">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header ">
             <a class="navbar-brand " href="index.jsp" ></a>			<!--    	title -->
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                       
               <ul class="nav navbar-nav navbar-center">
                    <li>
                        <a href="cook/index.jsp">餐廳</a>
                    </li>
                    <li>
                        <a href="services.html">市集</a>
                    </li>
                    <li>
                        <a href="contact.html">協尋</a>
                    </li>
                    <li>
                        <a href="contact.html">血庫</a>
                    </li>
                </ul>
            <ul class="nav navbar-nav navbar-right">
                 <c:if test="${not empty mem}">
                            <li id="profile-image">
                              <a href="${pageContext.servletContext.contextPath}/MemInfo.jsp"><img  src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${mem.mem_mail}&type=memPhoto" width="20" height="20">
                              ${mem.mem_name} <!--會員名 --></a>	<!-- 會員照片-->         
                           </li>
                          
                           <!--  通知 -->
                    <li class="dropdown"  style="display:none" id="alert">
                   
                        <a href="#" class="dropdown-toggle  glyphicon glyphicon-bell" data-toggle="dropdown"><span class="badge" id="alerttotal">00</span></a>
                        <ul class="dropdown-menu" >                       
                      		 <c:forEach var="alertlist" items="${alert}">       
                            	<li>
                           	 		<div class="panel panel-default">
   									 	<div class="panel-body">
       										<img src="${pageContext.servletContext.contextPath}/memPhoto.do?id=${alertlist.mem_mail}&type=memPhoto" width="60" height="60"  id="alertimg">${alertlist.mem_name}  	&nbsp;&nbsp;&nbsp; 寄出交友邀請給你<br>	
       									 	<div id= "mid" class="${mem.mem_id}"  style="display:none"></div>	
       										<div id ="almid" class="${alertlist.mem_id}"  style="display:none"></div>	
       										<button  id="removefri" type="submit" class="btn btn-default" style="float:right">刪除邀請</button>
       										<button  id="joinfri"  type="submit" class="btn btn-default" style="float:right">接受</button>
    									</div>
									</div>               	
                            	</li> 
                          	</c:forEach>
                          
                       	 </ul>
                    	</li> 

                            <li> 
                                  <a href="${pageContext.servletContext.contextPath}/logout.do?logout=登出">登出</a>
                            </li>
                  </c:if>
                  

       

<!-- 登入                   -->
                    <li class="dropdown" id="loginbutton">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown">登入</a>
                        <ul class="dropdown-menu" >
                            	<li>
                           	 		<div class="panel panel-default">
   									 	<div class="panel-body">
       												<form action="login.do"   method="post" id="loginForm">
    													<div class="form-group">
      														<label>E-MAIL:</label>
     														<input class="form-control"  placeholder="E-MAIL:" name="email">${message.email}
    													</div>
  														<div class="form-group">
    			  											<label for="pwd">Password:</label>
      														<input  class="form-control" id="pwd" placeholder="Password" name="pwd">${message.pwd}
    														</div>
   	  													<button type="submit" class="btn btn-default pull-right" >登入</button>${message.invalid}
  													</form>	
  													<hr>
  													<a href="#" id ="regbutton">註冊 </a>
    									</div>
									</div>               	
                            	</li> 
                        </ul>
                    </li>  
                            
                            
                            
                            


                 </ul>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides photo 大小 1900x1080-->  
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('imgs/1.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('imgs/2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('imgs/3.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>


    <!-- Page Content -->
    <div class="container">
        <!-- Marketing Icons Section -->
        <div class="row">
        	 <div class="col-lg-12" id="intro">
      			     <h2>Petfriends的成立，是期望聚集喜愛動物、飼養動物的民眾到平台上互動，進一步於現實生活中拓展寵物間的交流，
      			     達到寵物良好的社會化效果，降低恐懼。推動血型配對（目前以貓、狗為主），望能在短時間內替毛小孩成功挽救性命。認養與協尋，
      			     讓因人類飼養而無法返回大自然的動物，擁有屬於自己的家。另外，專用食譜分享、物用品贈送等，皆是希望飼主可以運用更多資源，
      			     讓寵物擁有快樂的生活。</h2>
           	 </div>
        <div class="col-md-4"></div>
        <div class="col-md-4">
         <br>
             <div  id="regform" style="display:none">
		  			<form action="register.do"   method="post">
						<div class="form-group">
      						<label>會員名字:</label>
     						<input class="form-control"  placeholder="會員名字:" name="name">${Regmessage.name}
    					</div>
    					<div class="form-group">
      						<label>E-MAIL:</label>
     						<input class="form-control"  placeholder="E-MAIL:" name="email">${Regmessage.email}
    					</div>
  						<div class="form-group">
    			  			<label for="pwd">Password:</label>
      						<input  class="form-control" id="pwd" placeholder="Password" name="pwd">${Regmessage.pwd}
    					</div>	
   	  					<div class="form-group">
      						<label>寵物名:</label>
     						<input class="form-control"  placeholder="寵物名:" name="petName">${Regmessage.petName}
    					</div>  		
    					<div class="form-group">
    			  			<label for="pwd">寵物簡介:</label>
    			  			 <textarea class="form-control" cols="30" rows="10" name="petInfo" placeholder="寵物InFo:">${Regmessage.petInfo}</textarea>
    					</div>
    						 <button type="button" id="Cancel"  class="btn btn-default pull-right">Cancel</button>
    						 <button type="submit" class="btn btn-default pull-right" id="regbutton">註冊</button>
  	    		  </form>
			</div>
        </div>
        <div class="col-md-4"></div>
  		</div>
  		
  	 	 <hr>
        <footer>
            <div class="row">
                <div class="col-lg-12 pull-right">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
	</div>




    <!-- /.container -->


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>


    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });

    
    //註冊表單SHow
  	$("#regbutton").click(function(){
	 	$("#regform").toggle();
  		$("#intro").toggle();
 	 });
    
	$('#Cancel').click(function(){
		$("#regform").toggle();
  		$("#intro").toggle();
	});
    
 	$("#profile-image").show(function(){
 		$("#loginbutton").hide();
 		$("#alert").show();
 	})
 	
 	
 	
    var count = $("#alert li").children().length;
	$("#alerttotal").text(count);


	
	
	$(document).on("click","#removefri",function(){
		var mid = $(this).parent().children("#mid").attr("class");
		var friid=  $(this).parent().children("#almid").attr("class");
		
		$.get("fristatus",{"id": mid, "fri":friid ,"type":"removeinvalid" } , function(){			
		alert("fri: "+ mid + "mid :"+friid );
		})
		.done(function(data){
			if(data){
				alert("移除成功");
				location.reload();
			}
		})
		.fail(function(){
			alert("移除失敗 ，請洽管理員");
		});
	});
	
	

	$(document).on("click","#joinfri",function(){
		
		var mid = $(this).parent().children("#mid").attr("class");
		var friid=  $(this).parent().children("#almid").attr("class");
		
		$.get("fristatus",{"id": friid ,"fri":mid,"type":"join" }, function(){	
		})
		.done(function(data){
			if(data){
				alert("成功加入");
				location.reload();
			}
		})
		.fail(function(){
			alert("加入失敗 ，請洽管理員");
		});
	});
	
	
    </script>

</body>