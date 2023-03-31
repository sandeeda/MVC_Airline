package airline.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BookingFlight {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "flight_id")
    private Flight flight;
    
    @ManyToOne
    @JoinColumn(name = "flight_passenger_id")
    private FlightPassenger flightPassenger;

    public BookingFlight() {}

    public BookingFlight(Flight flight, FlightPassenger flightPassenger) {
        this.flight = flight;
        this.flightPassenger = flightPassenger;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public FlightPassenger getFlightPassenger() {
		return flightPassenger;
	}

	public void setFlightPassenger(FlightPassenger flightPassenger) {
		this.flightPassenger = flightPassenger;
	}

	@Override
	public String toString() {
		return "BookingFlight [id=" + id + ", flight=" + flight + ", flightPassenger=" + flightPassenger + "]";
	}


}
