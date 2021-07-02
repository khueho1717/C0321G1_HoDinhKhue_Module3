import java.security.NoSuchAlgorithmException;

import static com.codegym.Calculator.*;

public class Calculator {

    public static void main(String[] args) {
        System.out.println("Tổng 2 số: " + sum(5, 9));
        System.out.println("Hiệu 2 số: " + sub(5, 9));
        System.out.println("Tích 2 số: " + mul(5, 9));
        try {
            System.out.println("Thương 2 số: " + divide(10, 5));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}
