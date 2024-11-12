// src/main/java/com/booking/repository/Table.java
package com.booking.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Table<T> {
    private final Map<String, T> data = new HashMap<>();
    
    public void insert(String id, T item) {
        data.put(id, item);
    }
    
    public T get(String id) {
        return data.get(id);
    }
    
    public void update(String id, T item) {
        data.put(id, item);
    }
    
    public void delete(String id) {
        data.remove(id);
    }
    
    public List<T> getAll() {
        return new ArrayList<>(data.values());
    }
    
    public boolean exists(String id) {
        return data.containsKey(id);
    }
    
    public void clear() {
        data.clear();
    }
}