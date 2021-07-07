package furama.controller.employee_servlet;

import furama.model.bean.Employee;
import furama.model.service.employee_service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee_view")
public class EmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_employee":
                    insertEmployee(request, response);
                    break;
//                case "edit":
//                    updateUser(request, response);
//                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        EmployeeService employeeService = new EmployeeService();
        Employee employee = null;
        int employeeId = 1;
        String employeeName = request.getParameter("name");
        String employeeBirthday = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("id_card");
        double employeeSalary = Double.parseDouble(request.getParameter("salary"));
        String employeePhone = request.getParameter("phone");
        String employeeEmail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationDegreeId = Integer.parseInt(request.getParameter("degree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String userName = request.getParameter("user_name");
        employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, userName);

        employeeService.insertData(employee);

        response.sendRedirect("/employee_view");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "1":
                break;
            default:
                response.sendRedirect("/employee_view/create_employee.jsp");
                break;
        }
    }
}
