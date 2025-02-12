package track;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.*;
// class menu を定義する
class Menu{
  int dishId;
  int number;
  int price;
   // パラメータ化されたコンストラクタ
    public Menu(int dishId, int number, int price) {
        this.dishId = dishId;
        this.number = number;
        this.price = price;
    }
    
    // Getters と Setters
    public int getDishId() { return dishId; }
    public void setDishId(int dishId) { this.dishId = dishId; }
    
    public int getNumber() { return number; }
    public void setNumber(int number) { this.number = number; }
    
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
}
// class order　を定義する
class Order{
  int tableId;
  int dishId;
  int number;
  // パラメータ化されたコンストラクタ
    public Order(int tableId, int dishId, int number) {
        this.tableId = tableId;
        this.dishId = dishId;
        this.number = number;
    }
    
    // Getters と Setters
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
    // String[] lines = getStdin();
    // for (int i = 0, l = lines.length; i < l; i++) {
    //   String output = String.format("line[%s]: %s", i, lines[i]);
    //   System.out.println(output);
    // }


    // メニューはメニューのすべての行を保存します
    ArrayList<Menu> menus = new ArrayList<>();
    // 
    HashMap<Integer, Integer> menuTable = new HashMap<>();
    // menuTableはdishIdからメニューの行へのマップです
    ArrayList<Order> orders = new ArrayList<>();
    // 新しいスキャナー
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    sc.nextLine(); 
    int m;
    int k;
    // System.out.println("n = "+n);
    // ステップ　1
    if(n==1){
      m = sc.nextInt();
      sc.nextLine(); 
      // System.out.println("m = "+m);
      //　メニューを読む 
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
        // 食料が十分にあるか確認する
        if(menu.getNumber()>=number){
          menu.setNumber(menu.getNumber()-number);
          for(int i=0;i<number;i++) System.out.println("received order "+tableId+" "+dishId);
      }
      else{
        System.out.println("sold out "+tableId);
      }
      }

      
    }
    // ステップ２
    else if( n==2){
       m = sc.nextInt();
       k = sc.nextInt();
       int k0 =k;
      sc.nextLine(); 
      //System.out.println("m = "+m);
      //System.out.println("k = "+k);
      // メニューを読む 
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      // 入ってきた注文をキューに入れる
      Queue<Order> queue = new LinkedList<Order>();
      // 調理中の料理をリストに保存する
      ArrayList<Order> cook = new ArrayList<Order>();
      while(sc.hasNext()){
        String s1 = sc.next();
        if(s1.equals("received")){
          String o = sc.next();
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          Order order = new Order(tableId, dishId,1);
          // キューに新しい注文を追加する
          queue.offer(order);
          // 空いている電子レンジがあれば
          if(k>0){
            // 空いている電子レンジの数を減らす
            k--;
            // キューから注文を取り出す
            Order order0 = queue.poll();
            // 注文を電子レンジリストに入れる
            cook.add(order0);
            // 料理番号を出力する
            System.out.println(order0.getDishId());
          }
          else{
            // 出力「wait」
            System.out.println("wait");
          }
        }
        // 料理完成情報があれば
        else if(s1.equals("complete")){
          // 空いている電子レンジの数を増える
          k++;
          int dishId = sc.nextInt();
          int i;
          // この料理番号に対応するオーダーはあるかどうか記録する
          int flag=0;
          // この料理番号に対応するオーダーを探す
          for(i=0;i<cook.size();i++){
            if(cook.get(i).getDishId()==dishId){
              flag=1;
              // 注文をキューは空いていないの場合 
              if(!queue.isEmpty()){
                // 空いている電子レンジを数を減らす
                k--;
                // キューから最前のオーダーを取り出す
                Order order2 = queue.poll();
                // このオーダーを電子レンジに入れる
                cook.add(order2);
                System.out.println("ok "+order2.getDishId());
              }
              // 注文をキューは空いているから、何もしません
              else System.out.println("ok");
              // この注文を電子レンジのリストから削除する
              cook.remove(i);
              break;
            }
          }
          // この料理番号に対応するオーダーは無ければ
          if(flag==0){
            // 入力が間違っているため、空き電子レンジの数はリセットする必要があります
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
      // メニューを入力
      for(int i=0;i<m;i++){
        int dishId = sc.nextInt();
        int number = sc.nextInt();
        int price = sc.nextInt();
        Menu menu1 = new Menu(dishId, number, price);
        // System.out.println("menu = "+menu1.getDishId()+" "+menu1.getNumber()+" "+menu1.getPrice());
        menus.add(menu1);
        menuTable.put(dishId, i);
      }
      // 調理中の料理をリストに保存する
      // ArrayList<Order> cook = new ArrayList<Order>();
      HashMap<Integer, Queue<Order>> cookMap = new HashMap<>();
      while(sc.hasNext()){
        String s1 = sc.next();
        if(s1.equals("received")){
          String o = sc.next();
          int tableId = sc.nextInt();
          int dishId = sc.nextInt();
          Order order = new Order(tableId, dishId,1);
          // 新しいオーダーを電子レンジに入れる
          // cook.add(order);
          Queue<Order> q1 = cookMap.getOrDefault(dishId, new LinkedList<Order>());
          q1.offer(order);
          cookMap.put(dishId, q1);
          
        }
        else if(s1.equals("complete")){
          int dishId = sc.nextInt();
          int i;
          int flag=0;
          // この料理番号に対応するオーダーを探す
          if(!cookMap.get(dishId).isEmpty()){
            Order order3 = cookMap.get(dishId).poll();
            flag=1;
            System.out.println("ready "+order3.getTableId()+" "+dishId);
          }
        //   for(i=0;i<cook.size();i++){
        //     if(cook.get(i).getDishId()==dishId){
        //       flag=1;
        //       System.out.println("ready "+cook.get(i).getTableId()+" "+dishId);
        //       cook.remove(i);
        //       break;
        //     }
        //   }
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
      // このテーブル内のテーブルIDから注文数へのマップ
      HashMap<Integer, Integer> tableMap = new HashMap<>();
      // このテーブル内のテーブルIDから合計価格へのマップ
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