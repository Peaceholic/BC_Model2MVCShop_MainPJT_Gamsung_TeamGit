  package site.gamsung.controller.transfer;
  
  import java.io.File; 
  import java.io.IOException; 
  import java.nio.file.Files;
  import java.nio.file.Path; 
  import java.nio.file.Paths; 
  import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
  
  import org.springframework.beans.factory.annotation.Autowired; 
  import org.springframework.beans.factory.annotation.Qualifier; 
  import org.springframework.beans.factory.annotation.Value; 
  import org.springframework.stereotype.Controller; 
  import org.springframework.ui.Model; 
  import org.springframework.web.bind.annotation.GetMapping; 
  import org.springframework.web.bind.annotation.ModelAttribute; 
  import org.springframework.web.bind.annotation.RequestMapping; 
  import org.springframework.web.bind.annotation.RequestMethod; 
  import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search; 
  import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.transfer.ReceiveService;
import site.gamsung.service.transfer.TransferService;

  
  @RequestMapping("/transfer/*")
  @RestController 
  public class TransferRestController {
	  
   @Value("#{commonProperties['pageUnit']}")
   int pageUnit;
   
   @Value("#{commonProperties['pageSize']}")
   int pageSize;
	   
  @Value("#{commonProperties['communityPageSize']}") int communityPageSize;
    
  @Autowired
  @Qualifier("transferServiceImpl") private TransferService transferService;
  
  @Autowired
  @Qualifier("receiveServiceImpl") private ReceiveService receiveService; 
  
  
  
  public TransferRestController() { 
	  System.out.println(this.getClass()); 
  }

  
  
	
//	  // ?????? list
//	  
//	  @RequestMapping (value = "rest/listReceive")
//	  
//	  public List<Receive> listReceive (@RequestParam String transferNo, Search search, Model
//	  model, HttpSession session) throws Exception{
//	  
//	  System.out.println("listReceive"); // listPost ??????
//	  
//	  User user = (User)session.getAttribute("user"); 
//	  
//	  search.setRole(user.getRole());
//	  search.setTransferNo(Integer.parseInt(transferNo));
//	  search.setId(user.getId());
//	  
//	  System.out.println(user);
//	  
//	  return receiveService.listReceive(search);
//	  
//	  }
	 
  
// ?????? ??????.
	  
	@RequestMapping(value = "rest/addReceive") 
	public int addReceive (@ModelAttribute("receive") Receive receive, String transferNoo, HttpSession session, Model model) throws Exception{
		 
		 System.out.println("addReceive:::");
		 System.out.println(receive);
	
		 Transfer transfer = new Transfer();
	
		 transfer.setTransferNo(Integer.parseInt(transferNoo));
		 receive.setTransferNo(transfer);
		 
		 User user = (User)session.getAttribute("user");
		 receive.setTransferee(user);
		 
		 System.out.println("receive getTransfer => "+ receive.getTransferNo());
	//	 System.out.println("receive => " + receive);
	//	 receiveService.addReceive(receive);
		 
		 return receiveService.addReceive(receive);
	}

  
  

	/*
	 * //?????? delete
	 * 
	 * @RequestMapping(value = "rest/deleteComment")
	 * 
	 * @ResponseBody public Post deleteComment (@RequestParam String commentno, Post
	 * post) throws Exception{
	 * 
	 * System.out.println("deleteComment");
	 * 
	 * int commentnoo = Integer.parseInt(commentno);
	 * 
	 * System.out.println("DeleteCommentNo:::::::" + commentnoo);
	 * 
	 * int a= communityService.deleteComment(commentnoo);
	 * 
	 * System.out.println("aaaaa:"+a); //
	 * System.out.println("Post::"+communityService.updatetotalComment(commentnoo));
	 * 
	 * post = communityService.updatetotalComment(commentnoo);
	 * 
	 * return post; }
	 * 
	 * 
	 * //????????? ????????? ??????
	 * 
	 * @RequestMapping(value = "rest/searchListCamp")
	 * 
	 * @ResponseBody public Map<String, Object> searchListCamp
	 * (@ModelAttribute("search") Search search, Map<String, Object> map) throws
	 * Exception{
	 * 
	 * // ??????????????? ?????? ?????? ????????? ???????????? ???????????? ???????????? ????????? ??????. ????????? ????????? searchKeyword??? ?????????.
	 * 
	 * System.out.println("searchListCamp");
	 * 
	 * if (search.getCurrentPage() == 0) { search.setCurrentPage(1); }
	 * 
	 * System.out.println("???????????? ????????? ????????????????"+search.getSearchKeyword());
	 * search.setPageSize(5);//5?????? ????????????. search.setSearchCondition("????????? ?????????"); //?????????
	 * ?????? ?????????
	 * 
	 * return campSearchService.listCamp(search); }
	 * 
	 * 
	 */
  
  
 // ?????????????????? ????????? ??????
 @RequestMapping(value = "rest/updateTransferStatus")   
 public int updateTransferStatus(@ModelAttribute("receive") Receive receive, @RequestParam("transferNoo") int transferNoo, HttpSession session, Model model) throws Exception {

    System.out.println("updateTransferStatus Start");
    Transfer transfer = new Transfer();

    int receiveNo = receive.getReceiveNo();
    int transferNo = transferNoo;
    
    receive.setReceiveNo(receiveNo);    
    transfer.setTransferNo(transferNo);
    receive.setTransferNo(transfer);
    
    System.out.println(receiveNo);
    System.out.println(transferNo);
   
    
    return receiveService.updateTransferStatus(receive);
 }
 
 
 // ????????? ???????????? ?????? ????????? ?????????
 @RequestMapping(value = "rest/listTransferForReceive")   
 
 public List<Transfer> listTransferForReceive(HttpSession session) throws Exception {

    System.out.println("listTransferForReceive Start");
    
	 User user = (User)session.getAttribute("user");

	Search search = new Search ();
	
	search.setId(user.getId());
    Map<String, Object> map = transferService.listTransferForReceive(search);
	 
    return (List<Transfer>) map.get("list");
    
    
    
    
 }
 
 
 
 
 
 
 
 
 
 // ?????????????????? My ????????? navigation   
 
 @RequestMapping(value = "rest/listMyTransfer")   
 
 public Map<String, Object> listMyTransfer(HttpSession session, Model model, Search search) throws Exception {

    System.out.println("listMyTransfer Start");

    User user = (User) session.getAttribute("user");

     Map<String, Object> map = new HashMap<String, Object>();
     
     if (search.getCurrentPage() == 0) {
          search.setCurrentPage(1);
       }
           
    search.setPageSize(10);
    search.setId(user.getId()); // listMyTransfer??? search??? id??? ?????????. 

    map.put("search", search);
           
    map = transferService.listTransfer(map);
    
    int TotalCount = (int) map.get("TotalCount");
 
    List<Transfer> Transferlist =  (List<Transfer>) map.get("list");
    
    Page resultPage = new Page( search.getCurrentPage(), TotalCount, pageUnit, pageSize);
          
    System.out.println(Transferlist);
    
    Map<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("user", user);
    resultMap.put("Transferlist", Transferlist);
    resultMap.put("resultPage", resultPage);      
    
    return resultMap;
 }
  
  
  
  
  
  
  
  
  }//CommunityRestController END