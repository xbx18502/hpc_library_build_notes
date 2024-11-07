import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;
public class App {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        List<String> s = new ArrayList<>();
        List<String> s2 = new LinkedList<>();
        s.add("Hello");
        s.add("World");
        s.remove(0);
        System.out.println(s.get(0));
    }
}