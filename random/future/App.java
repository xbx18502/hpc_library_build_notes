// supercomputer reserve system
package track;
import java.util.*;

public class App {
    public static void main(String[] args) {
        // new a scanner
        Scanner sc = new Scanner(System.in);
        
        // get input
        // n: number of time slot
        // m: number of reserved time slot
        long n = sc.nextLong();
        long m = sc.nextLong();
        
        // new a hashset to store reserved time slot
        Set<Long> reserved = new HashSet<>();
        for (long i = 0; i < m; i++) {
            reserved.add(sc.nextLong());
        }
        
        // get number of request
        long q = sc.nextInt();
        
        // compute requests
        for (long i = 0; i < q; i++) {
            // get start and end of query
            long l = sc.nextLong();
            long r = sc.nextLong();
            
            // new a result
            long result = -1;
            
            // check [l,r]
            for (long j = l; j <= r; j++) {
                // if no unreserved time slot
                if (!reserved.contains(j)) {
                    result = j;
                    break;
                }
            }
            
            // output result
            System.out.println(result);
        }
        
        sc.close();
    }
}