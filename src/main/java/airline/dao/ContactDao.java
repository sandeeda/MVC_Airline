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

import airline.model.Contact;
import airline.model.Flight;

@Component
@Transactional
public class ContactDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void addContact(Contact contact) {
        hibernateTemplate.save(contact);
    }

    public void updateContact(Contact contact) {
        hibernateTemplate.update(contact);
    }

    public void deleteContact(int id) {
        Contact contact = hibernateTemplate.load(Contact.class, id);
        hibernateTemplate.delete(contact);
    }

    public Contact getContactById(int id) {
        return hibernateTemplate.get(Contact.class, id);
    }

    public List<Contact> getAllContacts() {
        return hibernateTemplate.loadAll(Contact.class);
    }

	
}
