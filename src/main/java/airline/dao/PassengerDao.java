package airline.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import airline.model.Passenger;

@Repository
@Transactional
public class PassengerDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void addPassenger(Passenger passenger) {
		hibernateTemplate.save(passenger);
	}

	public Passenger getPassengerById(int id) {
		return hibernateTemplate.get(Passenger.class, id);
	}

	public List<Passenger> getAllPassengers() {
		return hibernateTemplate.loadAll(Passenger.class);
	}

	public void updatePassenger(Passenger passenger) {
		hibernateTemplate.update(passenger);
	}

	public void deletePassenger(int id) {
		Passenger passenger = getPassengerById(id);
		hibernateTemplate.delete(passenger);
	}

}
