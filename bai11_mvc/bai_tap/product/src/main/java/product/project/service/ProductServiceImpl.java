package product.project.service;

import product.project.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Iphone X", "Apple", 1000));
        products.put(2, new Product(2, "Iphone XI", "Apple", 1500));
        products.put(3, new Product(3, "Iphone XII", "Apple", 1700));
        products.put(4, new Product(4, "Note 20", "Samsung", 1000));
        products.put(5, new Product(5, "Note 20 ultra", "Samsung", 1200));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
