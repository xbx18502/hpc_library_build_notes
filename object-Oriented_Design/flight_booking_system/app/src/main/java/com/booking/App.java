// src/main/java/com/booking/Main.java
package com.booking;

import com.booking.entity.User;
import com.booking.repository.Table;

public class App {
    public static void main(String[] args) {
        // 测试Table类
        Table<User> userTable = new Table<>();
        
        // 测试插入
        User user1 = new User("1", "John Doe", "john@example.com", "1234567890");
        userTable.insertById(user1.getId(), user1);
        userTable.insert(new User("2", "Jane Graves", "jane@qq.com", "0987654321"));
        userTable.insert(new User("3", "Tom Trump", "tom@gmail.com", "1357924680"));

        // print all users
        for (User user : userTable.getAll()) {
            System.out.println("User: " + user.getName());
        }
        // 测试查询
        User retrieved = userTable.get("1");
        System.out.println("Retrieved user: " + retrieved.getName());
        
        // 测试更新
        User updatedUser = new User("1", "John Updated", "john@example.com", "1234567890");
        userTable.update("1", updatedUser);
        retrieved = userTable.get("1");
        System.out.println("Updated user: " + retrieved.getName());
        
        // 测试删除
        userTable.delete("1");
        System.out.println("User exists after deletion: " + userTable.exists("1"));
    }

    public String getGreeting() {
        return "Hello world.";
    }
}