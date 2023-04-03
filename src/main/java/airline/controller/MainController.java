package airline.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import airline.config.EmailService;
import airline.dao.AdminDao;
import airline.dao.BookingFlightDao;
import airline.dao.ContactDao;
import airline.dao.FlightDao;
import airline.dao.FlightPassengerDao;
import airline.model.Admin;
import airline.model.BookingFlight;
import airline.model.Contact;
import airline.model.Flight;
import airline.model.FlightPassenger;

@Controller
public class MainController {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private FlightDao flightDao;
	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private FlightPassengerDao flightPassengerDao;
	@Autowired
	private BookingFlightDao bookingFlightDao;
    @Autowired
    private EmailService emailService;
    

	private List<Flight> allFlights;
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int PNR_LENGTH = 6;

    public static String generatePNR() {
        StringBuilder sb = new StringBuilder(PNR_LENGTH);
        Random random = new Random();
        for (int i = 0; i < PNR_LENGTH; i++) {
            int index = random.nextInt(ALPHA_NUMERIC_STRING.length());
            sb.append(ALPHA_NUMERIC_STRING.charAt(index));
        }
        return sb.toString();
    }


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
			redirectView.setUrl(request.getContextPath() + "/landingUserMapping");
			return redirectView;
		} else {
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath() + "/loginfailed");
			return redirectView;
		}

	}

	
	@RequestMapping("/landingUserMapping")
	public String showRegularUserLandingPage(Model m) {
		return "landingUser";
	}
	
	@RequestMapping("/loginfailed")
	public String showLoginFailed(Model m) {
		return "error";
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
	        emailService.sendHtmlEmail(passenger.getEmail(), passenger.getName(),"<html>"
	                + "<head>"
	                + "<meta charset=\"utf-8\">"
	                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
	                + "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">"
	                + "</head>"
	                + "<body>"
	                + "<div class=\"container\">"
	                + "<h2>Booking Confirmation</h2>"
	                + "<p>Hello " + passenger.getName() + ",</p>"
	                + "<p>Your booking is confirmed. Your flight PNR is : " + generatePNR() + "</p>"
	                + "<p>Thank you for choosing our airline.</p>"
	                + "</div>"
	                + "</body>"
	                + "</html>");
	    }
	    
	    // redirect to a confirmation page
        Flight flightById = flightDao.getFlightById(Integer.valueOf(flightId));
	    m.addAttribute("flightById", flightById);
	    m.addAttribute("bookings", bookings);
	    return "successFlightBooking";
	}
	@RequestMapping(value = "/handleSubmitContact", method = RequestMethod.POST)
	public String confirmBooking(@RequestParam("name") String name,
			@RequestParam("message") String inputMessage,
			@RequestParam("email") String email, Model m) {
		
		contactDao.addContact(new Contact(name, email, inputMessage));
        
//		emailService.sendHtmlEmail(email, "We have heard you "+name, "We have received your concern:"
//				+ "\nSomeone from our team will contact you within next 48 hours"
//				+ "\nYour message : "+ inputMessage);
		
		emailService.sendHtmlEmail(email, "We have heard you "+name, 
			    "<html><head>"
			    + "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" "
			    + "integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" "
			    + "crossorigin=\"anonymous\">"
			    + "</head><body>"
			    + "<div class=\"container\">"
			    + "<h1>We have received your concern</h1>"
			    + "<p>Someone from our team will contact you within the next 48 hours.</p>"
			    + "<p>Your message:</p>"
			    + "<p>" + inputMessage + "</p>"
			    + "</div>"
			    + "</body></html>");

		
		return "landingUser";
	}
	


    @GetMapping("/contactUs")
    public String showContactUsPage() {
        return "contactUs";
    }
}
