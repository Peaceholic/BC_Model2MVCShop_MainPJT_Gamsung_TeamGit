package site.gamsung.controller.transfer;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.transfer.ReceiveService;
import site.gamsung.service.transfer.TransferService;


@RequestMapping("/transfer/*")
@Controller
public class TransferController {
	
	
	@Autowired
	@Qualifier("transferServiceImpl")
	private TransferService transferService;	

	@Autowired
	@Qualifier("receiveServiceImpl")
	private ReceiveService receiveService;	
	
	
	
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	public TransferController() {
		System.out.println(this.getClass());
	}

	// ?????? ?????? ?????? ????????? navigation
	
	@RequestMapping(value = "addTransfer", method = RequestMethod.GET)	
	public String addTransfer(HttpSession session, Model model) {

		System.out.println("addTransfer Start");

		// ???????????? ?????? ????????? ????????? ????????? ????????????.
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
				
		 Search search = new Search();
		 String id = user.getId();		
		 
		 if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			
		search.setPageSize(10);
		 		 
		 Map<String, Object> List	= campReservationService.listMyReservation(search, id);

		 
		List<CampReservation> list = (List<CampReservation>) List.get("list");
		
		System.out.println("list::::::::::::::::::::::::::"+list);
		System.out.println("list:::::::::::::::::???");
			
		model.addAttribute("userId", user.getId());
		model.addAttribute("list", list);

		return "forward:/view/transfer/addTransfer.jsp";
	}
	
	
	// ?????????????????? Mapping

	@RequestMapping(value = "addTransfer", method = RequestMethod.POST) // RequestParam??? ????????? file type????????? name??? ?????????.
	public String addTransfer(@ModelAttribute("transfer") Transfer transfer, MultipartFile[] paymentImgs,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		System.out.println("addTransfer Post Start");
		System.out.println("transfer:::::::"+transfer);
		
			int index = 1;
			
//			ArrayList<String> imgs = new ArrayList<String>();
			
			for (MultipartFile multpartfile : paymentImgs) {

				// MultipartFile??? ?????? postImg?????? file????????? originalPostImg??? ?????????.
				String originalPostImg = multpartfile.getOriginalFilename();

				System.out.println("originalPostImg::::" + originalPostImg + "!");

				if (originalPostImg != null && originalPostImg != "") {

					// ??? ????????? .??? ????????? ???????????? ????????? ???????????? ?????? (ex .jsp)
					String originalFileExtension = originalPostImg.substring(originalPostImg.lastIndexOf("."));

					// UUID??? ???????????? ??????????????? -??? ????????? ????????? ???????????? ?????? (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
					String root_path = req.getSession().getServletContext().getRealPath("/");
					String attach_path = "uploadfiles/transfer/";
					String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

					System.out.println(root_path);
					// File??? ???????????? ????????? ?????? ?????? ??????????????? ?????????.
					File file = new File(root_path + attach_path + storedFileName);

					System.out.println("file::::" + file);

					// MultipartFile.transferTo(File file) - Byte????????? ???????????? File????????? ????????? ?????? ????????? ????????????.
					// file?????? ????????? ???????????? ??????????????? ??????. ?????? PostImg??? ?????????.
					multpartfile.transferTo(file); // postImg??? transferto(?????????)file???

					System.out.println("file");
					System.out.println("file.getPath::" + file.getPath());

//					imgs.add(storedFileName);
				
					if (index == 1) {
						transfer.setPaymentImg(storedFileName);
					} else if (index == 2) {
						transfer.setPaymentImg(storedFileName);
					} else {
						transfer.setPaymentImg(storedFileName);
					}

					index++;

				} // originalPostImg if??? END

			} // postImg for??? END

//			transfer.setPaymentImg(imgs);
			
			User user = (User) session.getAttribute("user");
			
			
			
			transfer.setTransferOr(user);

			transferService.addTransfer(transfer);

//		???????????? ??? ??????????????????. 
			
		return "redirect:listTransfer";
	}// ?????? method ??????
	
	
	
	// ???????????? ?????? ????????? navigation	
	@RequestMapping(value = "listTransfer")	
	public String listTransfer(@ModelAttribute("search")Search search , HttpSession session, Model model) throws Exception {

		System.out.println("listTransfer Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 	 
		 if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
				 
		search.setPageSize(10);

		map.put("search", search);
				 
		map = transferService.listTransfer(map);
		
		int TotalCount = (int) map.get("TotalCount");
	
		List<Transfer> list =  (List<Transfer>) map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), TotalCount, pageUnit, pageSize);
				
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("resultPage", resultPage);		
		
		return "forward:/view/transfer/listTransfer.jsp";
	}
	
	
	
	// ?????? ?????? ????????? 
	
	@RequestMapping(value = "getTransfer")	
	public String getTransfer(@RequestParam("transferNo") int transferNo, HttpSession session, Model model, Search search) throws Exception {

		System.out.println("getTransfer Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
					
		 Transfer transfer = transferService.getTransfer(transferNo);
		 
		System.out.println("getTransfer:::"+transfer);
				  
		  search.setRole(user.getRole());
		  search.setTransferNo(transferNo);
		  search.setId(user.getId());
		  search.setCurrentPage(1);
		  search.setPageSize(10);
			
			//search setting?????? ??????????????? ???????????? ????????? ???????????????. ????????? 10????????? ???????????????. 
		  
		  List<Receive> listreceive = receiveService.listReceive(search);	
		  
		  System.out.println("listreceive"+listreceive);
	
			model.addAttribute("user", user);
			model.addAttribute("transfer", transfer);
			model.addAttribute("listreceive", listreceive);
	
		return "forward:/view/transfer/getTransfer.jsp";
	}
	
	// ?????????????????? My ????????? navigation	
	@RequestMapping(value = "listMyTransfer")	
	public String listMyTransfer(@ModelAttribute("search")Search search, HttpSession session, Model model) throws Exception {

		System.out.println("listMyTransfer Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
			
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
		
		model.addAttribute("user", user);
		model.addAttribute("Transferlist", Transferlist);
		model.addAttribute("resultPage", resultPage);		
		
		return "forward:/view/transfer/listMyTransfer.jsp";
	}
	
	
	// ???????????? My ????????? navigation	
	
	@RequestMapping(value = "listMyReceive")	
	public String listMyReceive(HttpSession session, Model model, Search search) throws Exception {

		System.out.println("listMyReceive Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
		
		 if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}	
		search.setPageSize(10);
		search.setId(user.getId());
		
		 List<Receive> listreceive = receiveService.mylistReceive(search);	
		 
		 System.out.println(listreceive);
		 	model.addAttribute("search",search);
			model.addAttribute("listreceive", listreceive);
		
		 return "forward:/view/transfer/listMyReceive.jsp";
	}
	
	
	
	
}
