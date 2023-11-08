/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duong
 */
public class Librarian {
    private int LibrarianID;
    private String Name;
    private String Address;
    private String Phone;
    private String Email;
    
        public int getLibrarianID(){
        return LibrarianID;
    }
    
    public void setLibrarianID(int LibrarianID){
        this.LibrarianID = LibrarianID;
    }
    
    public String getName(){
        return Name;
    }
    
    public void setName(String Name){
        this.Name = Name;
    }
    
    public String getAddress(){
        return Address;
    }
    
    public void setAddress(String Address){
        this.Address = Address;
    }
    
    public String getPhone(){
        return Phone;
    }
    
    public void setPhone(String Phone){
        this.Phone = Phone;
    }
    
    public String getEmail(){
        return Email;
    }
    
    public void setEmail(String Email){
        this.Email = Email;
    }
    
    public Librarian (int LibrarianID, String Name, String Address, String Phone, String Email){
        this.LibrarianID = LibrarianID;
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
    }
}