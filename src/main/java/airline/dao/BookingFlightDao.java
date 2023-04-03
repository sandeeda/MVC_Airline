package airline.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import airline.model.BookingFlight;

@Repository
@Transactional
public class BookingFlightDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void saveBooking(BookingFlight bookingFlight) {
        hibernateTemplate.save(bookingFlight);
    }

}
