import java.util.ArrayList;
import java.util.List;

class Employee {
    String name;
    public Employee(String name) {
        this.name = name;
    }
}

public class Main {
    public static void main(String[] args) {
        List<Employee> employees = List.of(
                new Employee("Abu"),
                new Employee("bhavan"),
                new Employee("Aarif"),
                new Employee("Dhanush"),
                new Employee("Arjun"),
                new Employee("fahath"),
                new Employee("Antony"),
                new Employee("gokul"),
                new Employee("Ashwin"),
                new Employee("vijay"),
                new Employee("Anu")
        );

        employees.stream()
                .filter(e -> e.name.startsWith("A"))
                .forEach(e -> System.out.println(e.name));
    }
}
