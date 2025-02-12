package track;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.*;
class Menu{
  int dishId;
  int number;
  int price;
   // Parameterized constructor
    public Menu(int dishId, int number, int price) {
        this.dishId = dishId;
        this.number = number;
        this.price = price;
    }
    
    // Optional: Getters and Setters
    public int getDishId() { return dishId; }
    public void setDishId(int dishId) { this.dishId = dishId; }
    
    public int getNumber() { return number; }
    public void setNumber(int number) { this.number = number; }
    
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
}
class Order{
  int tableId;
  int dishId;
  int number;
  // Parameterized constructor
    public Order(int tableId, int dishId, int number) {
        this.tableId = tableId;
        this.dishId = dishId;
        this.number = number;
    }
    
    // Optional: Getters and Setters
    public int getTableId() { return tableId; }
    public void setTableId(int tableId) { this.tableId = tableId; }
    
    public int getDishId() { return dishId; }
    public void setDishId(int dishId) { this.dishId = dishId; }
    
    public int getNumber() { return number; }
    public void setNumber(int number) { this.number = number; }
}

public class App {
  
  public static void main(String[] args) throws IOException {
    // このコードは標準入力と標準出力を用いたサンプルコードです。
    // このコードは好きなように編集・削除してもらって構いません。
    // ---
    // This is a sample code to use stdin and stdout.
    // Edit and remove this code as you like.
    ArrayList<Menu> menus = new ArrayList<>();
    HashMap<Integer, Integer> menuTable = new HashMap<>();
    ArrayList<Order> orders = new ArrayList<>();
    // String[] lines = getStdin();
    // for (int i = 0, l = lines.length; i < l; i++) {
    //   String output = String.format("line[%s]: %s", i, lines[i]);
    //   System.out.println(output);
    // }
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    sc.nextLine(); 
    int m;
    int k;
    // System.out.println("n = "+n);
    if(n==1){
      m = sc.nextInt();
      sc.nextLine(); 
      // System.out.println("m = "+m);
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      while(sc.hasNext()){
        String s1 = sc.next();
        int tableId = sc.nextInt();
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        Order order1 = new Order(tableId, dishId, number);
        orders.add(order1);
        // System.out.println("order = "+order1.getTableId()+" "+order1.getDishId()+" "+order1.getNumber());

      }
      for(Order order:orders){
        int tableId = order.getTableId();
        int dishId = order.getDishId();
        int number = order.getNumber();
        int index = menuTable.get(dishId);
        Menu menu = menus.get(index);
        if(menu.getNumber()>=number){
          menu.setNumber(menu.getNumber()-number);
          for(int i=0;i<number;i++) System.out.println("received order "+tableId+" "+dishId);
      }
      else{
        System.out.println("sold out "+tableId);
      }
      }

      
    }
    else if( n==2){
       m = sc.nextInt();
       k = sc.nextInt();
       int k0 =k;
      sc.nextLine(); 
      //System.out.println("m = "+m);
      //System.out.println("k = "+k);
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      Queue<Order> queue = new LinkedList<Order>();
      ArrayList<Order> cook = new ArrayList<Order>();
      while(sc.hasNext()){
        String s1 = sc.next();
        if(s1.equals("received")){
          String o = sc.next();
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          Order order = new Order(tableId, dishId,1);
          queue.offer(order);
          if(k>0){
            k--;
            Order order0 = queue.poll();
            cook.add(order0);
            System.out.println(order0.getDishId());
          }
          else{
            
            System.out.println("wait");
          }
        }
        else if(s1.equals("complete")){
          k++;
          int dishId = sc.nextInt();
          int i;
          int flag=0;
          for(i=0;i<cook.size();i++){
            if(cook.get(i).getDishId()==dishId){
              flag=1;
              if(!queue.isEmpty()){
                k--;
                Order order2 = queue.poll();
                cook.add(order2);
                System.out.println("ok "+order2.getDishId());
              }
              else System.out.println("ok");
              cook.remove(i);
              break;
            }
          }
          if(flag==0){
            k--;
            System.out.println("unexpected input");
            continue;
          }
          
          
        }
        else{
          // System.out.println("unexpected input");
        }

      }
    }
    else if(n==3){
      m= sc.nextInt();
      sc.nextLine(); 
      //System.out.println("m = "+m);
      //System.out.println("k = "+k);
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      
      ArrayList<Order> cook = new ArrayList<Order>();
      while(sc.hasNext()){
        String s1 = sc.next();
        if(s1.equals("received")){
          String o = sc.next();
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          Order order = new Order(tableId, dishId,1);
          cook.add(order);
          
        }
        else if(s1.equals("complete")){
          int dishId = sc.nextInt();
          int i;
          int flag=0;
          for(i=0;i<cook.size();i++){
            if(cook.get(i).getDishId()==dishId){
              flag=1;
              System.out.println("ready "+cook.get(i).getTableId()+" "+dishId);
              cook.remove(i);
              break;
            }
          }
          if(flag==0){
            System.out.println("unexpected input");
            continue;
          }
          
          
        }
        else{
          // System.out.println("unexpected input");
        }
      

    }

  }
  else if(n==4){
      m= sc.nextInt();
      sc.nextLine(); 
      //System.out.println("m = "+m);
      //System.out.println("k = "+k);
      HashMap<Integer, Integer> tableMap = new HashMap<>();
      HashMap<Integer, Integer> tableSum = new HashMap<>();
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      //ArrayList<Order>  orders = new ArrayList<Order>();
      // int sum=0;
      while(sc.hasNext()){
        String s1= sc.next();
        if(s1.equals("received")){
          String o = sc.next();
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          Order order = new Order(tableId, dishId,1);
          orders.add(order);
          tableMap.put(tableId, tableMap.getOrDefault(tableId,0)+1);
        }
        else if(s1.equals("ready")){
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          int index = menuTable.get(dishId);
          tableSum.put(tableId, tableSum.getOrDefault(tableId,0) + menus.get(index).getPrice());
          tableMap.put(tableId, tableMap.getOrDefault(tableId,0)-1);
          for(int i=0;i<orders.size();i++){
            if(orders.get(i).getTableId()==tableId && orders.get(i).getDishId()==dishId){
              orders.remove(i);
              break;
            }
          }
        }
        else if(s1.equals("check")){
          int tableId = sc.nextInt();
          if(tableMap.getOrDefault(tableId,0)>0){
            System.out.println("please wait");
          }
          else{
            System.out.println(tableSum.getOrDefault(tableId,0));
            tableSum.put(tableId, 0);
          }

        }
        else{

        }
      }
  }
  }

  private static String[] getStdin() throws IOException {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in), 1_048_576);
    ArrayList<String> lines = new ArrayList<>();
    String line;
    while ((line = br.readLine()) != null) {
      lines.add(line);
    }
    return lines.toArray(new String[lines.size()]);
  }
}