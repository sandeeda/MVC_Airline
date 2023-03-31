package airline.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FlightPassenger {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    private String email;
    
    private int age;


	@Override
	public String toString() {
		return "FlightPassenger [id=" + id + ", name=" + name + ", email=" + email + ", age=" + age + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public FlightPassenger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FlightPassenger(String name, String email, int age) {
		super();
		this.name = name;
		this.email = email;
		this.age = age;
	}

    // Constructors, getters and setters, and other methods
    

}
