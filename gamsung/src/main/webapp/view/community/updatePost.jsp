<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Post Add</title>
    
      <jsp:include page="../../resources/commonLib.jsp" />
      
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">


      <style>
      .camera-box{
        display: flex;
         color: #c1c1c1; */
        flex-direction: column;
      }
      
   
     .camera-video .camera-box+.camera-box{
      	margin-left : 20px
      }
      
      .camera-box div svg{
        width: 90%;
        height: 90%;
      }
      .camera-box .video-btn svg{
        transform: translateY(4px);
      }

      .camera-box .camera-btn svg{
        transform: translateY(2px);
      }
      
      .camera-video{
        display: flex;
        justify-content: flex-start;
        text-align: center;
        color: #c1c1c1;
        padding-bottom: 10px;      	
      }
      
      #file {
       display: none;
        }
        
        
    .form-control.add {
    border-radius: 9px;
    background-color: #b3c2d124;
    border: #f0f8ff00;
}

#postupdate {
border-radius: 9px;
    background-color: #676869;
    color: rgb(255 255 255 / 70%);
    font-size: 15px;
    padding: 4px;
    font-family: 'Gaegu', cursive;
    letter-spacing: 1px;
}

     </style>



  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" style="background: #fff">
    <main>


      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      
      
       <!-- header -->
       <jsp:include page="../common/header.jsp"/>   
       <!-- headerEnd -->
      
        <section class="module" id="contact">
          <div class="container">
          
            <div class="row">
                <!-- sidebar Start -->
				<jsp:include page="leftCommunity.jsp"/>
              	<!-- sidebar End -->

     <!--addPost Start-->   
     
	   		  <div class="col-sm-8 col-sm-offset-1">
	    		  <h2 class="module-title font-alt " style="color: #666666;text-align: inherit;position:inherit; font-family: 'Gaegu', cursive; font-size: 35px;letter-spacing: -3px;margin: 0px;">???????????? ???????????????
                </h2>
                  <div class="module-subtitle font-serif"></div>              
              </div>
         
              <div class="col-sm-8 col-sm-offset-1"> 
                
         <form name="postForm" id="postForm"  style="width: 500px" role="form" >

		<input type="hidden" id="postNo" name="postNo" value="${post.postNo}"/> 
		<input type="hidden" id="postConcernCount" name="postConcernCount" value="${post.postConcernCount}"/> <!-- ????????? ??? ?????????(?????????????????? ?????????????????? ???) -->		
		<input type="hidden" id="postRegdate" name="postRegdate" value="${post.postRegdate}"/>		
		<input type="hidden" id="deleteFlag" name="deleteFlag" value="${post.deleteFlag}"/>		
		<input type="hidden" id="commentTotalCount" name="commentTotalCount" value="${post.commentTotalCount}"/>		
		<input type="hidden" id="conDeleteFlag" name="conDeleteFlag" value="${post.conDeleteFlag}"/>				
		<input type="hidden" id="concernType" name="concernType" value="${post.concernType}"/>				
		
		
         <div class="form-group">
           <select class="form-control add" name="postType"  id="postType" style="width: 216px">
           <option selected="selected">??????????????? ??????????????????.</option>
            <option value="1"  ${ ! empty post.postType && post.postType==1 ? "selected" : "" }>???????????????</option>
            <option value="2"  ${ ! empty post.postType && post.postType==2 ? "selected" : "" }>???????????????</option>
            <option value="3"  ${ ! empty post.postType && post.postType==3 ? "selected" : "" }>?????? ??????</option>
            <option value="4"  ${ ! empty post.postType && post.postType==4 ? "selected" : "" }>???????????????</option>
            <option value="5"  ${ ! empty post.postType && post.postType==5 ? "selected" : "" }>???????????????</option>                
           </select>
         </div>    

         <div class="form-group">
           <label class="sr-only" for="title">??????</label>
           <input class="form-control add" type="text" id="postTitle" name="postTitle" value="${post.postTitle}" required="required" />
           <p class="help-block text-danger"></p>
         </div>

         <div class="form-group">
           <label class="sr-only" for="content">??????</label>
           <textarea class="form-control add" id="postContent" name="postContent" required="required" style="height: 514px">${post.postContent}</textarea>
           <p class="help-block text-danger"></p>
         </div>

         <div class="form-group">
           <label class="sr-only" for="hashtag">????????????</label>
           <input class="form-control add" type="text" id="allhashtag" name="allhashtag" value="${post.hashtag1}${post.hashtag2}${post.hashtag3}"></input>
           <p class="help-block text-danger"></p>
         </div>
	
		<input type="hidden" id="hashtag1" name="hashtag1" value="">
	  	<input type="hidden" id="hashtag2" name="hashtag2" value="">
		<input type="hidden" id="hashtag3" name="hashtag3" value=""> 
         
        
         
        <div class="camera-video">     
                    
          <div class="camera-box">	
            <div class="image-upload">
           	 
	           	 <button type="button" id="filebutton" class="btn btn-outline-dark" style="background-color: white; padding-left: 0px; padding-right: 0px;">					                
	           	   <div class="camera-btn" style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">                  
	                 	<svg xmlns="http://www.w3.org/2000/svg" class="bi bi-camera" width="16" height="16" fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
		                   <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
		                   <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
	                   </svg>
	             	</div>????????????
	             </button>
			   
			   <input type="file" id="file" name="postImg" accept="image/*" multiple="multiple" onchange="uploadFile(this)" style="display:none"/>	
			      
             </div><!-- image-upload end -->
          </div><!-- camera-box 1  end -->
 
             
             <div class="image-show" id="image-show"></div>
                         
             <div class="camera-box">
             
	   			 <button type="button" class="btn btn-outline-dark" style="background-color: white; padding-left: 0px; padding-right: 0px;"">
					<div class="video-btn" style="width: 100px;  border: 1px solid;  border-radius: 20px;   margin-bottom : 5px;  text-color : #EAEAEA;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-video" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2V5zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556v4.35zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1H2z"></path>
		    			</svg>
					</div>???????????????
				 </button>
             </div>

            </div>
            
            <div class="text-center">
              <button class="btn btn-block btn-round btn-d" id="postupdate" name="1" type="button">????????? ??????</button>
            </div>

          </form>
          </div>
      </div>
    </div>
  </section>
</main>
        
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resources/lib/wow/wow.js"></script>
    <script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
    <script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../../resources/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="../../resources/lib/smoothscroll.js"></script>
    <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/main.js"></script>
    
	<script>
	

    $(function() {
		 $("button:button[name='1']").on("click" , function() {
		//  $("#postsubmit").on("click" , function() {
			//Debug..
			fncUpdatePost();
		 });
		 
   });	 
		 
   function fncUpdatePost(){
   	
   	console.log("fncUpdatePost ??????")
   	
   	var postTile = $("input[name='postTile']").val();
   	var postType = $("select[name='postType']").val();    	
   	var postContent = $("textarea[name='postContent']").val();
 		var hashtags = $('#allhashtag').val().split('#');
 		
       hashtags.shift(); // ????????? ?????? ?????? 

	    console.log($('#allhashtag').val()); 
  		console.log(hashtags);
     
   	if(postTile == ''){
   		alert("????????? ??????????????????");
   		$("input:text[name='postTile']").focus();
   		return;
   	}
   
   	if(postContent == ''){
   		alert("????????? ??????????????????");
   		$("textarea:text[name='postContent']").focus();
   		return;
   	}
   	
   	if(postType == ''){
   		alert("????????? ??????????????????");
   		$("select[name='postType']").focus();
   		return;
   	}

     	if(hashtags.length >  4){
      		alert("??????????????? ?????? 3??? ?????? ?????? ???????????????.");
       	$('#allhashtag').focus();
       	return;
    	}
    	
     	
     	hashtags.forEach((el, index) => { /* array??? ??????  item ?????????, ????????? ????????? index ????????? ????????? 0,  ????????? ????????? 1 , ????????? ????????? 2*/
    
       var i = index + 1 ;  /* 0+1=1 , 1+1=2 , 2+1=3 .... ????????? var??? hashtag?????? ?????? ??????.  */
       
       $('#hashtag'+i).val('#'+el); /* #hashtag1, #hashtag2, #hashtag3??? val??? ?????????. el??? ?????????  */
       
       console.log("??????????????????"+$('#hashtag'+i).val());

     	})
		
		
   	if(confirm("?????????????????????????")) { 
			$("form").attr("method" , "POST").attr("action","/community/updatePost").attr("enctype","multipart/form-data").submit();	
		}
     	
     	
     	// input ??? name??? propertiy??? ?????????. ????????? ????????? ??????. 
   };
   
    $('#filebutton').click(function(){
    		$('#file').click();
    		});

    function uploadFile(e){
   		 console.log("file Name:",e.value);}


     
    </script>
   
</body>
</html>