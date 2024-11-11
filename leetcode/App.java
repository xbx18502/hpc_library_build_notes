import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;
public class App {
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        // array
        int[] arr = new int[10];
        int[] arr2 = {1, 2, 3, 4, 5};
        int[] arr3 = new int[]{1, 2, 3, 4, 5};
        System.out.println(arr2[0]);
        System.out.println(arr2.length);

        //2-D array
        int[][] arr4 = new int[2][3];
        int[][] arr5 = {{1, 2, 3}, {4, 5, 6}};

        // string
        String str = "Hello World";
        String str2 = new String();
        System.out.println(str.charAt(0));
        System.out.println(str.substring(0, 5));
        System.out.println(str.indexOf("World"));
        System.out.println(str.length());

        // list
        List<String> s = new ArrayList<>();
        List<String> s2 = new LinkedList<>();
        s.add("Hello");
        s.add("World");
        s.remove(0);
        System.out.println(s.get(0));

        //2-D list
        List<List<Integer>> l = new ArrayList<>();

        // stringbuilder
        StringBuilder sb = new StringBuilder();
        sb.append("Hello");
        sb.append("World");
        sb.setLength(sb.length() - 1);
        sb.insert(4, "123");
        sb.deleteCharAt(9);
        System.out.println(sb.toString());
        sb.setLength(0);
        sb.append("123");
        String cur = sb.toString();
        Integer a = Integer.valueOf(cur);
        int b = Integer.parseInt(cur);
        System.out.println(a);  
        System.out.println(b);

        // set
        Set<Integer> set = new HashSet<>();
        set.add(1);
        set.add(2);
        set.add(3);
        set.remove(1);
        System.out.println(set.contains(2));
        



    }
}