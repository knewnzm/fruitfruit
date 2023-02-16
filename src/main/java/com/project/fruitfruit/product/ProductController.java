package com.project.fruitfruit.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.fruitfruit.answer.AnswerService;
import com.project.fruitfruit.review.Review;
import com.project.fruitfruit.review.ReviewService;
import com.project.fruitfruit.support.Support;
import com.project.fruitfruit.support.SupportService;
import com.project.fruitfruit.util.Page;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;
	@Autowired
	private ReviewService rService;
	@Autowired
	private SupportService sService;
	
	

	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\product\\";

	
	/*
	 * @RequestMapping("/") public String index(Model model) { List<Product> list =
	 * pService.selectProductListByLimit(0, 4); model.addAttribute("list", list);
	 * 
	 * List<Product> list2 = pService.onlyProductPick(0, 4);
	 * model.addAttribute("list2", list2);
	 * 
	 * List<Product> list3 = pService.orderByProductHitDesc(0, 4);
	 * model.addAttribute("list3", list3);
	 * 
	 * return "index"; }
	 */
	
//	@RequestMapping(value = "/") //홈으로 가기
//	public String index() { 
//		return "/index";
//	}
	

	@GetMapping("/product/productForm")
	public void addForm() {
	}
	
	private void uploadFile(MultipartFile file, int product_num) {
		File dir = new File(projectPath + webPath + product_num);
		if (!dir.exists()) {
			dir.mkdir();
		}
		
		if (!file.isEmpty()) {
			String uploadPath = webPath + product_num + "/" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			if (!f.exists()) {
				try {
					f.createNewFile();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void uploadInnerFiles(MultipartFile file, int product_num, int inner_img_num) {
		File dir = new File(projectPath + webPath + product_num);
		if (!dir.exists()) {
			dir.mkdir();
		}
		if (!file.isEmpty()) {
			String uploadPath = webPath + product_num + "\\" + inner_img_num + "_" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//insert
	@PostMapping("/product/productForm")
	public String addProduct(Product p) {
		pService.insertProduct(p);

		int product_num = pService.selectSeqProductCurrval();
		uploadFile(p.getFile(), product_num);
		// uploadInnerFiles(p.getInnerFile1(), product_num, 1);
		// uploadInnerFiles(p.getInnerFile2(), product_num, 2);
		// uploadInnerFiles(p.getInnerFile3(), product_num, 3);
		
		
		return "redirect:/product/productDetail?product_num=" + product_num;
	}
	
	@GetMapping("/product/productEdit")
	public void editForm() {
	}
	
	//edit
	@PostMapping("/product/productEdit")
	public String editProduct(Product p) {
		pService.updateProduct(p);
		int product_num = pService.selectSeqProductCurrval();
		uploadFile(p.getFile(), product_num);
		return "redirect:/product/productDetail?product_num=" + product_num;
	}

	//selectAll
	@RequestMapping("/product/productList")
	public String list(	Model model, 
						@RequestParam(defaultValue = "1", required = false) int p, 
						@RequestParam(defaultValue = "0", required = false) int type) {
		Page page = new Page(p, pService.getProductListSize());
		page.pageInfo();
		if (p > page.getMaxPage() && page.getMaxPage() != 0) {
			return "redirect:/product/productList?p=" + page.getMaxPage();
		} else {
			List<Product> list = selectList(
					type, 
					page.getStartList(),
					page.getStartList() + page.getListSize());
			
			
			model.addAttribute("plist", list);
			model.addAttribute("page", page);
			model.addAttribute("type", type);
			
			return request.getContextPath() + request.getRequestURI();
		}
	}
	
	private ArrayList<Product> selectList(int type, int start, int end){
		ArrayList<Product> list = null;
		
		switch (type) {
		case 0: {
			list = pService.selectProductListByLimit(start, end);
			break;
		}
		case 1: {
			list = pService.orderByProductHitDesc(start, end);
			break;
		}
		case 2: {
			list = pService.orderByProductPriceAsc(start, end);
			break;
		}
		case 3: {
			list = pService.orderByProductPriceDesc(start, end);
			break;
		}
		case 4: {
			list = pService.orderByProductDate(start, end);
			break;
		}
		case 5: {
			list = pService.onlyProductPick(start, end);
			break;
		}
		case 6: {
			list = pService.onlyProductViewTypeBlind(start, end);
			break;
		}
//		case 7: {
//			list = pService.selectProductBySellerId(start, end);
//			break;
//		}
		default:
//			list = pService.selectProductListByLimit(start, end);
		}
		return list;
	}
	
	@GetMapping("/product/productSearch")
	public String search(
			@RequestParam(defaultValue = "1", required = false) int p, 
			@RequestParam(required = false) String keyword, Model model) {
		Page page = new Page(p, pService.getProductListSize());
		page.pageInfo();
		if (p > page.getMaxPage() && page.getMaxPage() != 0) {
			return "redirect:/product/productSearch?p=" + page.getMaxPage();
		} else {
			if (!keyword.equals("")) {
				request.setAttribute("keyword", keyword);
				model.addAttribute("keyword", keyword);
				
				ArrayList<Product> list = pService.selectProductListByTitleOrUserId(keyword);
				model.addAttribute("plist", list);
				
				model.addAttribute("page", page);
			}
			else {
				return "redirect:/product/productList";
			}
		}
		
		return "/product/productSearch";
	}
	
	//select
	@RequestMapping("/product/productDetail")
	public void viewProduct(@RequestParam int product_num, Model model) {
		pService.addProductHit(product_num);////
		Product p = pService.selectProduct(product_num);
		model.addAttribute("p", p);
		
		List<Review> reviews = rService.selectReviewAllByProductNum(product_num);
		model.addAttribute("reviews", reviews);
		
		List<Support> supports = sService.selectSupportByProductNum(product_num);
		model.addAttribute("supports", supports);
		
	}
	
	//delete
	@RequestMapping("/product/delete")
	public String deleteProduct(@RequestParam int product_num) {
		String user_id = (String) session.getAttribute("user_id");
		int user_type = (int) session.getAttribute("user_type");
		Product p = pService.selectProduct(product_num);
		
		if (user_id.equals(p.getProduct_seller_id()) || user_type == 2) {
			if (p.getProduct_view_type() == 0) {	//blinded
				pService.deleteProduct(product_num);
			} else {
				pService.updateProductViewTypeBlind(product_num);
			}
			return "redirect:/product/productList";
		} else {
			return "redirect:/member/loginForm";
		}
	}

	
	//관리자 픽 
	private void setProductPick(boolean bool, int product_num) {
		if (bool) {
			pService.updateProductPickTrue(product_num);
		} else {
			pService.updateProductPickFalse(product_num);
		}
	}
	

	/*
	 * @RequestMapping(value="/product/mylist") public void go(Model model) { String
	 * product_seller_id = (String) session.getAttribute("user_id");
	 * System.out.println("세션아이디:"+product_seller_id); ArrayList<Product>
	 * p=pService.selectProductBySellerId(1, 10, product_seller_id);
	 * System.out.println(p); model.addAttribute("plist", p); }
	 * 
	 */
	
	
}
