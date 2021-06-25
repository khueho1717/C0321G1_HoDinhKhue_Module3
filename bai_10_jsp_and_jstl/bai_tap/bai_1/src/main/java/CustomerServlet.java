import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet",urlPatterns = "")
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        List<Customer> customerList=new ArrayList<>();
        customerList.add(new Customer("Mai Thúy Trâm","1983-08-20","Hà Nội","data:image/jpeg;base64,/9j/4AAQSk\n" +
                "        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\n" +
                "        QMzVqoduLFHKD5AfOdZmkkkqpmkzSSQqBpGfSSSEILwar2EzJAp034neZZLWFpiSZUoteQmSSAiqL+k1lQWNtZiSaiUDHx9YtjJJKhd5JJIV//Z"));
        customerList.add(new Customer("Nguyễn Văn Nam","1990-11-12","Đà Nẵng","data:image/jpeg;base64,/\n" +
                "        9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8QDw8QDhANEBAQDw8\n" +
                "        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\n" +
                "        dT2xxqc8mV7XzX+xACvDWndz/wA1i2Bd7ebAA2SIYARjZiq7gAcl230o01/3k/8AwkcagDkdX8yX03pn5eP8ssDLEkGq6DLAzIACQAQAAAAAAAAf/9k="));

        request.setAttribute("customerList",customerList);

        RequestDispatcher requestDispatcher=getServletContext().getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }
}