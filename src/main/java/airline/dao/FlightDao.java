package airline.dao;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import airline.model.Flight;

@Component
@Transactional
public class FlightDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void addFlight(Flight flight) {
        hibernateTemplate.save(flight);
    }

    public void updateFlight(Flight flight) {
        hibernateTemplate.update(flight);
    }

    public void deleteFlight(int id) {
        Flight flight = hibernateTemplate.load(Flight.class, id);
        hibernateTemplate.delete(flight);
    }

    public Flight getFlightById(int id) {
        return hibernateTemplate.get(Flight.class, id);
    }

    public List<Flight> getAllFlights() {
        return hibernateTemplate.loadAll(Flight.class);
    }

	public void populate() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.registerModule(new JavaTimeModule()); // register the JavaTimeModule
		try {
            Flight[] flights = mapper.readValue(new File("C:/flight.json"), Flight[].class);
            List<Flight> flightList = Arrays.asList(flights);
            System.out.println(flightList);
            for (Flight flight1 : flightList) {
                hibernateTemplate.save(flight1);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }	
	}

	public List<Flight> filterFlights(String source, String destination, LocalDate departureDate) {
	    CriteriaBuilder builder = hibernateTemplate.getSessionFactory().getCurrentSession().getCriteriaBuilder();
	    CriteriaQuery<Flight> query = builder.createQuery(Flight.class);
	    Root<Flight> root = query.from(Flight.class);
	    
	    List<Predicate> predicates = new ArrayList();
	    if (source != null && !source.isEmpty()) {
	        predicates.add(builder.equal(root.get("source"), source));
	    }
	    if (destination != null && !destination.isEmpty()) {
	        predicates.add(builder.equal(root.get("destination"), destination));
	    }
	    if (departureDate != null) {
	        predicates.add(builder.equal(root.get("departureDate"), departureDate));
	    }
	    
	    query.select(root).where(predicates.toArray(new Predicate[] {}));
	    
	    return hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(query).getResultList();
	}

}
