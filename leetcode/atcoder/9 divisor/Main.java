import java.util.*;
public class Main {
    // Optimized divisor counting
    public static int countDivisors(long num) {
        int count = 0;
        long sqrt = (long)Math.sqrt(num);
        
        for (long i = 1; i <= sqrt; i++) {
            if (num % i == 0) {
                // If divisors are equal, count only one
                if (i * i == num) {
                    count++;
                } else {
                    // Otherwise count both divisors
                    count += 2;
                }
            }
        }
        return count;
    }
    
    public static int countNumbersWith9Divisors(long N) {
        if (N < 1) return 0;
        
        int result = 0;
        for (long i = 1; i <= N; i++) {
            if (countDivisors(i) == 9) {
                result++;
            }
        }
        return result;
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        long N = sc.nextLong(); // Changed to nextLong() for large numbers
        
        if (N > 4e12) {
            System.out.println("Number too large");
            sc.close();
            return;
        }
        
        System.out.println(countNumbersWith9Divisors(N));
        sc.close();
    }
}