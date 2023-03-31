package airline.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Train {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	String source;
	String destination;
	String departureTime;
	public Train() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public Train(int id, String source, String destination, String departureTime) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.departureTime = departureTime;
	}
	@Override
	public String toString() {
		return "Train [id=" + id + ", source=" + source + ", destination=" + destination + ", departureTime="
				+ departureTime + "]";
	}
	
	
}
