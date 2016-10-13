package com.niit.shoppingcart.DAO;


import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.niit.shoppingcart.Model.Category;
import com.niit.shoppingcart.DAO.CategoryDAO;


@Repository
public class CategoryDAOImpl implements CategoryDAO{
	private static final Logger logger = LoggerFactory.getLogger(CategoryDAOImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;


	public CategoryDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean saveOrUpdate(Category category){
		try {
			logger.debug("Session started");
			sessionFactory.getCurrentSession().saveOrUpdate(category);
			logger.debug("Category has been saved:"+category.getId());
			return true;
		} catch (Exception e) {
			logger.error("Operation failed");
			e.printStackTrace();
			return false;
		}
	
	} 

	@Transactional
	public boolean delete(Category category)
	    {     
		try {
			sessionFactory.getCurrentSession().delete(category);
			return true;
		}
		 catch (Exception e){
			e.printStackTrace();
		
		return false;
		}
		}

	@Transactional
	public Category get(int id) {
		String hql = "from"+" Category"+" where id=" +id;
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>) query.list();
		
		if (listCategory != null && !listCategory.isEmpty()) {
			return listCategory.get(0);
		}
		
		return null;
	}
	
	@SuppressWarnings("deprecation")

	@Transactional
  public List<Category> list(){
		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>)
		sessionFactory.getCurrentSession()
		.createCriteria(Category.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCategory;
	}

}
