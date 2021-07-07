package furama.model.repository.employee_repository;

import furama.model.bean.Employee;
import furama.model.repository.furama_repository.DBConnection;
import furama.model.repository.furama_repository.IFuramaRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IFuramaRepository<Employee> {
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee" + "  (employee_name,employee_birthday ,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,user_name) VALUES " +
            " (?, ?, ?,?, ?, ?,?, ?, ?,?, ?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from employee where id =?;";

    private static final String SELECT_ALL_EMPLOYEE = "select * from employee;";

    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where id = ?;";

    private static final String UPDATE_USERS_SQL = "update employee set employee_name = ?,employee_birthday= ?, employee_id_card =?,employee_salary= ?, employee_phone =?,employee_email= ?, employee_address =?,position_id= ?, education_degree_id =?, division_id =?, user_name =? where id = ?;";



    @Override
    public void insertData(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL);
                preparedStatement.setString(1, employee.getEmployeeName());
                preparedStatement.setString(2, employee.getEmployeeBirthday());
                preparedStatement.setString(3, employee.getEmployeeIdCard());
                preparedStatement.setDouble(4, employee.getEmployeeSalary());
                preparedStatement.setString(5, employee.getEmployeePhone());
                preparedStatement.setString(6, employee.getEmployeeEmail());
                preparedStatement.setString(7, employee.getEmployeeAddress());
                preparedStatement.setInt(8, employee.getPositionId());
                preparedStatement.setInt(9, employee.getEducationDegreeId());
                preparedStatement.setInt(10, employee.getDivisionId());
                preparedStatement.setString(11, "Nguyễn Văn An");

                preparedStatement.executeUpdate();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Employee selectData(int id) {
        Employee employee = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("user_name");

                    employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, userName);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllData() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("user_name");

                    employeeList.add(new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, userName));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return employeeList;
    }

    @Override
    public void deleteData(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {

            try {
                preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void updateData(Employee employee) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {

            try {
                preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);

                preparedStatement.setString(1, employee.getEmployeeName());
                preparedStatement.setString(2, employee.getEmployeeBirthday());
                preparedStatement.setString(3, employee.getEmployeeIdCard());
                preparedStatement.setDouble(4, employee.getEmployeeSalary());
                preparedStatement.setString(5, employee.getEmployeePhone());
                preparedStatement.setString(6, employee.getEmployeeEmail());
                preparedStatement.setString(7, employee.getEmployeeAddress());
                preparedStatement.setInt(8, employee.getPositionId());
                preparedStatement.setInt(9, employee.getEducationDegreeId());
                preparedStatement.setInt(10, employee.getDivisionId());
                preparedStatement.setString(11, employee.getUserName());


                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }
}
