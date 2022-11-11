
package com.onlinenursery.plantshop.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTittle;
    private String categoryDescription;
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();
    
    public Category() {
    }

    public Category(int categoryId, String categoryTittle, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTittle = categoryTittle;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTittle, String categoryDescription, List<Product> products) {
        this.categoryTittle = categoryTittle;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }
    
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTittle() {
        return categoryTittle;
    }

    public void setCategoryTittle(String categoryTittle) {
        this.categoryTittle = categoryTittle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTittle=" + categoryTittle + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
    
}
