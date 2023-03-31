package airline.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import airline.model.Train;

@Component
@Transactional
public class TrainDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	public void saveOrUpdate(Train train) {
		hibernateTemplate.saveOrUpdate(train);
	}
	
	public Train getById(int id) {
		return hibernateTemplate.get(Train.class, id);
	}
	
	public List<Train> getAll() {
		return hibernateTemplate.loadAll(Train.class);
	}
	
	public void delete(Train train) {
		hibernateTemplate.delete(train);
	}
	
	public List<Train> getTrainsBySourceAndDestination(String source, String destination) {
	    String query = "from Train where source = ?1 and destination = ?2";
	    return hibernateTemplate
	            .getSessionFactory()
	            .getCurrentSession()
	            .createQuery(query, Train.class)
	            .setParameter(1, source)
	            .setParameter(2, destination)
	            .getResultList();
	}
	
}
