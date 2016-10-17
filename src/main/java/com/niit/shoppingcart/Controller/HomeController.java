package com.niit.shoppingcart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.DAO.CategoryDAO;
import com.niit.shoppingcart.DAO.ProductDAO;
import com.niit.shoppingcart.Model.Product;

@Controller
public class HomeController {
	
	 @Autowired
	 ProductDAO productDAO;
	 
	 @Autowired
	 CategoryDAO categoryDAO;
	    
	 
	@RequestMapping(value={"/"})
	public String homepage(Model m){
	 m.addAttribute("userclickedhome", "true");
	 m.addAttribute("product",new Product());
	 m.addAttribute("allcategory", categoryDAO.list());
	 m.addAttribute("allproduct",productDAO.list());
	 
	 return "Home";
	}
	@RequestMapping(value ="ShowProduct/{id}" )
	public String ShowProduct(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {
	m.addAttribute("Clickedshowproduct", "true");
	 m.addAttribute("IndividualProduct", productDAO.getproduct(id));
	 return "ShowProduct";
	}


}
