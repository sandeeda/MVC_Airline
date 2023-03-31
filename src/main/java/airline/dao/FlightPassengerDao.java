package airline.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import airline.model.FlightPassenger;

@Repository
@Transactional
public class FlightPassengerDao {

	@Autowired
    private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Transactional
    public void saveFlightPassenger(FlightPassenger flightPassenger) {
        hibernateTemplate.save(flightPassenger);
    }

    public List<FlightPassenger> getAllFlightPassengers() {
        return hibernateTemplate.loadAll(FlightPassenger.class);
    }

    public FlightPassenger getFlightPassengerById(Long id) {
        return hibernateTemplate.get(FlightPassenger.class, id);
    }

    public void updateFlightPassenger(FlightPassenger flightPassenger) {
        hibernateTemplate.update(flightPassenger);
    }

    public void deleteFlightPassenger(FlightPassenger flightPassenger) {
        hibernateTemplate.delete(flightPassenger);
    }
}