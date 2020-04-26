//
// Assignment : 4
// Author : FIRAS ABOUSHAMALAH : 250-920-750
// Email : fabousha@uwo . ca
// 
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.function.Predicate;

public class CustomerManager extends ArrayList<Customer> {
	// Return a new list containing only the customers that match the given predicate
	public List<Customer> getCustomersBy (Predicate<Customer> predicate) {
		return Customer.stream()
                    .filter(predicate)
                    .collect(Collectors.<Customer>toList());
	}
	// Return a new list containing only customers 65 or older
	public List<Customer> getSeniors () {
		return getCustomersBy(customer) -> customer.getAge() >= 65;
	}
	// Return a new list containing only customers under 18
	public List <Customer> getChildren () {
		return getCustomersBy(customer) -> customer.getAge() < 18;
	}
	// Return a new list containing only customers in the given country
	public List <Customer> getCustomersFrom (String country) {
		return getCustomersBy(customer) -> customer.getCountry() == country;
	}
	// Return a new list containing only customers having a last name starting with the given prefix
	public List < Customer > getCustomersByLastNamePrefix (String prefix) {
		return getCustomersBy(customer) -> customer.getLastName().startsWith(prefix);
	}
}
