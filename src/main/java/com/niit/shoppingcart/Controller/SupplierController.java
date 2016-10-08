package com.niit.shoppingcart.Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.shoppingcart.DAO.SupplierDAO;
import com.niit.shoppingcart.Model.Supplier;

@Controller
public class SupplierController {

	@Autowired
    SupplierDAO supplierDAO;
	
	@RequestMapping(value = "/suppliergson" )
	@ResponseBody
	public String SupplierGson() {
		List<Supplier> list = supplierDAO.list();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data;
	}
	
	
	@RequestMapping(value="/Supplier", method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
		ModelAndView mv= new ModelAndView("/admin");
		mv.addObject("userclickedsupplier", "true");
		mv.addObject("allData",supplierDAO.list());
		return mv;
		
	}
	 
	/*@RequestMapping(value="/allData")
	public String getAllData(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
	
		model.addAttribute("allData",supplierDAO.list());
		return "Supplier";
	}*/
@RequestMapping(value="/addsupplier")
public String addItem(@ModelAttribute("supplier") Supplier s){
		
		this.supplierDAO.saveOrUpdate(s);
		return "redirect:/Supplier";
		
	}
	@RequestMapping(value="/ItemBysupplier/{id}")
	public String editItem(@PathVariable("id") int id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("supplier", this.supplierDAO.get(id));
		return "redirect:/Supplier";
		
}
	@RequestMapping(value="/deleteBysupplier/{id}")
	public String deleteItem(@PathVariable("id") int id,Supplier supplier)
	{
		supplierDAO.delete(supplier);
		return "redirect:/Supplier";
		
}
}