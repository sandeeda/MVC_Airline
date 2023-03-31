package airline.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import airline.dao.AdminDao;
import airline.dao.BookingDao;
import airline.dao.BookingFlightDao;
import airline.dao.FlightDao;
import airline.dao.FlightPassengerDao;
import airline.dao.PassengerDao;
import airline.dao.TrainDao;
import airline.model.Admin;
import airline.model.Booking;
import airline.model.BookingFlight;
import airline.model.Flight;
import airline.model.FlightPassenger;
import airline.model.Passenger;
import airline.model.Train;

@Controller
public class MainController {

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private TrainDao trainDao;

	@Autowired
	private PassengerDao passengerDao;

	@Autowired
	private BookingDao bookingDao;
	
	@Autowired
	private FlightDao flightDao;
	
	@Autowired
	private FlightPassengerDao flightPassengerDao;
	@Autowired
	private BookingFlightDao bookingFlightDao;
	
    @Autowired
    private HibernateTemplate hibernateTemplate;

	private List<Flight> allFlights;

	@RequestMapping("/")
	public String home(Model m) {
		return "login";
	}

	// handle login form
	@RequestMapping(value = "/handle-login", method = RequestMethod.POST)
	public RedirectView handleLogin(@ModelAttribute Admin admin, HttpServletRequest request, Model m) {
		List<Admin> admins = adminDao.getAdmins();
		boolean approved = false;
		for (Iterator iterator = admins.iterator(); iterator.hasNext();) {
			Admin admin2 = (Admin) iterator.next();
			System.out.println(admin2.getUsername());
			System.out.println(admin2.getPassword());
			System.out.println(admin.getPassword());
			System.out.println(admin.getPassword());
			if (admin2.getPassword().equals(admin.getPassword()) && admin.getUsername().equals(admin2.getUsername())) {
				System.out.println("HERE");
				approved = true;
			}

		}
		if (approved) {
			// List<Student> students = studentDao.getStudents();
			// m.addAttribute("students", students);
			m.addAttribute("loggedinuser", admin.getUsername());
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath() + "/findflight");
			return redirectView;
		} else {
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath() + "/loginfailed");
			return redirectView;
		}

	}

	@RequestMapping("/loginfailed")
	public String showLoginFailed(Model m) {
		return "error";
	}

	@RequestMapping("/pathlistoftrains")
	public String showListOfAllTrains(Model m) {
		List<Train> allTrains = this.trainDao.getAll();
		m.addAttribute("listoftrains", allTrains);
		return "listoftrains";
	}

	@RequestMapping("/findflight")
	public String bookFlight(Model m) {
		Flight flight = new Flight();
		m.addAttribute("flight", flight);

		allFlights = flightDao.getAllFlights();
		m.addAttribute("allFlights", allFlights);
		List<String> sources = new ArrayList();
	    List<String> destinations = new ArrayList();
	    for (Flight f : allFlights) {
	        sources.add(f.getSource());
	        destinations.add(f.getDestination());
	    }
	    Set<String> uniqueSources = new HashSet(sources);
	    Set<String> uniqueDestinations = new HashSet(destinations);
	    m.addAttribute("sources", uniqueSources);
	    m.addAttribute("destinations", uniqueDestinations);
	    return "findflight";
	}
	

	@RequestMapping(value = "/handle-filtertrain", method = RequestMethod.POST)
	public String showListOfTrainsBySrcAndDest(@RequestParam String source, @RequestParam String destination, Model m) {
		List<Train> allTrains = this.trainDao.getTrainsBySourceAndDestination(source, destination);
		m.addAttribute("listoftrains", allTrains);
		if (source.equals("") || destination.equals("")) {
			allTrains = this.trainDao.getAll();
			m.addAttribute("listoftrains", allTrains);
		}
		return "listoftrains";
	}

	@RequestMapping(value = "/handle-booktrain", method = RequestMethod.POST)
	public String showRegistrationToBookTrain(@RequestParam String trainId, Model m) {
		Train trainById = trainDao.getById(Integer.valueOf(trainId));
		m.addAttribute("trainbyid", trainById);
		return "bookingform";
	}

	@RequestMapping(value = "/handle-booking", method = RequestMethod.POST)
	public String handleBookingRequest(@RequestParam String trainId, @RequestParam String firstName,
			@RequestParam String lastName, @RequestParam String phoneNumber, @RequestParam String age, Model m) {
		Train trainById = trainDao.getById(Integer.valueOf(trainId));
		Passenger passenger = new Passenger();
		passenger.setAge(age);
		passenger.setFirstName(firstName);
		passenger.setLastName(lastName);
		passenger.setPhoneNumber(phoneNumber);
		passengerDao.addPassenger(passenger);
		Booking booking = new Booking(trainById, passenger);
		bookingDao.saveBooking(booking);
		m.addAttribute("booking", booking);
		return "success";
	}
	
	@RequestMapping(value = "/handle-filterFlight", method = RequestMethod.POST)
	public String handleBookFlightRequest (@RequestParam String source,
			@RequestParam String destination,
			@RequestParam String departureDate,
			@RequestParam String numTravellers,
			@RequestParam String travelClass,
			Model m) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.parse(departureDate, formatter);
		List<Flight> filterFlights = flightDao.filterFlights(source, destination, date);
		m.addAttribute("filterFlights", filterFlights);
		m.addAttribute("filterFlights", filterFlights);
		m.addAttribute("filterFlights", filterFlights);
		m.addAttribute("travelClass", travelClass);
		m.addAttribute("numTravellers", numTravellers);
		return "listOfFlights";
	}
	
	@RequestMapping(value = "/book-flight", method = RequestMethod.POST)
	public String handleBookFlightRequest(@RequestParam int id,
	        @RequestParam int numTravellers, Model m) {
		Flight flightById = flightDao.getFlightById(id);
	    m.addAttribute("flightById", flightById);
	    m.addAttribute("numTravellers", numTravellers);
	    return "bookingPage";
	}
	
	@RequestMapping(value = "/confirm-booking", method = RequestMethod.POST)
	public String confirmBooking(@RequestParam("flightId") String flightId,
	                              @RequestParam("numTravellers") String numTravellers,
	                              HttpServletRequest request, Model m) {
	    
		List<BookingFlight> bookings = new ArrayList<BookingFlight>();
	    for (int i = 1; i <= Integer.valueOf(numTravellers); i++) {
	        String name = request.getParameter("name" + i);
	        String email = request.getParameter("email" + i);
	        int age = Integer.parseInt(request.getParameter("age" + i));
	        
	        // Create a new FlightPassenger object and save it to the database
	        FlightPassenger passenger = new FlightPassenger( name, email, age);
	        flightPassengerDao.saveFlightPassenger(passenger);
	        
	        Flight flightById = flightDao.getFlightById(Integer.valueOf(flightId));
	        
	        BookingFlight bookingFlight = new BookingFlight(flightById, passenger);
	        bookings.add(bookingFlight);
	        bookingFlightDao.saveBooking(bookingFlight);
	    }
	    
	    // redirect to a confirmation page
        Flight flightById = flightDao.getFlightById(Integer.valueOf(flightId));
	    m.addAttribute("flightById", flightById);
	    m.addAttribute("bookings", bookings);
	    return "successFlightBooking";
	}

}
