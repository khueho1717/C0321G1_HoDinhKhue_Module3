import java.util.Scanner;

public class SolveTheEquation {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.println("giải phương trình bậc 2");
        System.out.println("nhập số thứ a");
        float a=scanner.nextInt();
        System.out.println("nhập số thứ b");
        float b=scanner.nextInt();
        System.out.println("nhập số thứ c");
        float c=scanner.nextInt();
        SolveQuadraticEquation.solveTheEquation(a,b,c);
    }
}
