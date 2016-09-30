package com.niit.shoppingcart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.DAO.CategoryDAO;
import com.niit.shoppingcart.Model.Category;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping(value="/Category",method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("category")Category category,BindingResult result,Model model)
	{
		ModelAndView mv=new ModelAndView("/admin");
		mv.addObject("userclickedcategory", "true");
		mv.addObject("allData",categoryDAO.list());
		return mv;
		
	}
	
	/*@RequestMapping(value="/Category")
	public String landpage(@ModelAttribute("category") Category category,BindingResult result,Model model)
	{
		model.addAttribute("allData",categoryDAO.list());
		return "Category";
	}*/
	
	/*@RequestMapping(value="/addcategory")
	public String getAllData(@ModelAttribute("category") Category category,BindingResult result,Model model)
	{
		model.addAttribute("allData",categoryDAO.list());
		return "Category";
	}*/
	
	@RequestMapping(value="/addcategory")
	public String addItem(@ModelAttribute("category") Category c)
	{
		this.categoryDAO.saveOrUpdate(c);
		  return "redirect:/Category";
		  
		 }
		 @RequestMapping(value="/ItemBycategory/{id}")
		 public String editItem(@PathVariable("id") int id,RedirectAttributes redirectAttributes)
		 {
		  redirectAttributes.addFlashAttribute("category", this.categoryDAO.get(id));
		  return "redirect:/Category";
		  
		}
		 @RequestMapping(value="/deleteBycategory/{id}")
		 public String deleteItem(@PathVariable("id") int id,Category category)
		 {
		  categoryDAO.delete(category);
		  return "redirect:/Category";
		  
		}
		
	}