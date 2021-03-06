<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">

	<!-- Bootstrap, jQuery CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>  	
  	
  	
  	<!-- ### headerCampBusiness resources Start ### -->
  	<script src="/resources/lib/jquery/jquery.js"></script>
    
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
    <!-- Stylesheets -->
    
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    
    <!-- Main stylesheet and color file-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
  	<!-- ### headerCampBusiness resources End ### -->  	
	
	<!-- JavaScript -->
	<script type="text/javascript">

		// ??????
		$(function() {
			//==> DOM Object GET 3?????? ?????? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#confirm").on("click" , function() {
				window.self.location = "/campBusiness/goSubMainCampBusiness";
			});
			
			$("#update").on("click" , function() {
				alert("?????????????????? ???????????????.")
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCampView").submit();
			});
			
			$("#delete").on("click" , function() {
				if (confirm("'??????'??? ???????????? ????????? ????????? \n?????? ????????? ????????? ??????????????????.") == true){    
					$("form").attr("method" , "POST").attr("action" , "/campBusiness/deleteCamp").submit();
				} else {
				    return;
				}			
			});
		
		});	

</script>		
	    
</head>

<body>

	<!-- headerCampBusiness -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<form>	
	<div class="container">		
		
	    <input type="hidden" name="campNo" value="${camp.campNo}">	
	    		
	    <br>
	    <br>	
		<div class="page-header">
	       <h3 class=" text-info">????????? ????????????</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????????ID</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.id}</div>
		</div>
		
		<hr/>
		    	
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campNo}</div>
		</div>
		
		<br>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRegDate}</div>
		</div>
		
		<hr/>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campName}</div>
		</div>
		
		<br>			
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>??????</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.addr}</div>
		</div>
		
		<br>
	
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-8 col-md-4">${campSession.user.campCall}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>??????</strong></div>
			<div class="col-xs-2 col-md-2">${camp.campTheme1}</div>				
			<div class="col-xs-2 col-md-2">${camp.campTheme2}</div>
		</div>
					
		<br>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-2 col-md-2">${camp.campNature1}</div>
			<div class="col-xs-2 col-md-2">${camp.campNature2}</div>
		</div>
		
		<br>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????? ????????????</strong></div>
			<div class="col-xs-2 col-md-2">
				<c:choose>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '??????'}"> 
						??????
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '???'}"> 
						??? (3???~5???)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '??????'}"> 
						?????? (6???~8???)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '??????'}"> 
						?????? (9???~11???)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '??????'}"> 
						?????? (12???~2???)
					</c:when>
					<c:when test="${ empty camp.campOperation1 || camp.campOperation1 == '??????'}"> 
						??????
					</c:when>
					<c:otherwise>
						??????
					</c:otherwise>
				</c:choose>	
			</div>
			<div class="col-xs-4 control-label">
				<c:choose>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '??????'}"> 
						??????
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '???'}"> 
						??? (3???~5???)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '??????'}"> 
						?????? (6???~8???)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '??????'}"> 
						?????? (9???~11???)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '??????'}"> 
						?????? (12???~2???)
					</c:when>
					<c:when test="${ empty camp.campOperation2 || camp.campOperation2 == '??????'}"> 
						??????
					</c:when>
					<c:otherwise>
						??????
					</c:otherwise>
				</c:choose>	
			</div>
		</div>
		
		<hr/>				
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>??????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campRate}</div>
		</div>
		
		<br>			
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>?????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campReservationCount}</div>
		</div>
		
		<br>
					
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>?????? ?????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campViewCountCurrentMonth}</div>
		</div>
	
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campSummery}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>????????????</strong></div>
			<div class="col-xs-8 col-md-4">${camp.campDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">	
			<div class="form-group">
		        <label for="campMapFile" class="col-xs-4 control-label">????????? ??????????????? </label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">           
		    <div class="form-group">
		        <label for="campImgFile1" class="col-xs-4 control-label">????????? ???????????????(1/5)</label>
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg1}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">		    
		    <div class="form-group">
		        <label for="campImgFile2" class="col-xs-4 control-label">????????? ???????????????(2/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg2}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">    
		    <div class="form-group">
		        <label for="campImgFile3" class="col-xs-4 control-label">????????? ???????????????(3/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg3}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">
		    <div class="form-group">
		        <label for="campImgFile4" class="col-xs-4 control-label">????????? ???????????????(4/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg4}" />
		            </div>
		    </div>
		</div>
		<br>  
		<div class="row">   
		    <div class="form-group">
		        <label for="campImgFile5" class="col-xs-4 control-label">????????? ???????????????(5/5)</label>				
		            <div class="col-xs-8">
		                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg5}" />
		            </div>
		    </div>	
		</div>
					
		<br>
		<br>
		
		<div class="row">	
	        <div class="col-xs-2">
	            <button id="delete" type="button" class="btn btn-danger">??????</button>
	        </div>
	        
	        <div class="col-xs-1">
	           	<button id="update"type="button" class="btn btn-warning">??????</button>
	        </div>
	        
	        <div class="col-xs-1 col-xs-offset-7">
	            <button id="confirm" type="button" class="btn btn-primary">??????</button>
		    </div>										  		  	
		</div>	

	</div>			
	</form>

</body>

</html>