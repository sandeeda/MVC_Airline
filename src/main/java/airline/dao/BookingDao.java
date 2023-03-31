package airline.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import airline.model.Booking;

@Repository
@Transactional
public class BookingDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void saveBooking(Booking booking) {
        hibernateTemplate.save(booking);
    }

}
