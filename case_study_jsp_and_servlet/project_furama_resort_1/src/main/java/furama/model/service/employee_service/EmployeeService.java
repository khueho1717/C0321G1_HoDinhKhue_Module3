package furama.model.service.employee_service;

import furama.model.bean.Employee;
import furama.model.repository.employee_repository.EmployeeRepository;
import furama.model.service.furama_service.IFuramaSevice;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IFuramaSevice<Employee> {
    private static EmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public void insertData(Employee employee) throws SQLException {
        employeeRepository.insertData(employee);
    }

    @Override
    public Employee selectData(int id) {
        return employeeRepository.selectData(id);
    }

    @Override
    public List<Employee> selectAllData() {
        return employeeRepository.selectAllData();
    }

    @Override
    public void deleteData(int id) throws SQLException {
        employeeRepository.deleteData(id);
    }

    @Override
    public void updateData(Employee employee) throws SQLException {
        employeeRepository.updateData(employee);
    }
}
