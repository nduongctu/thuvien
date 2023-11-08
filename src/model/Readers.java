/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duong
 */
public class Readers {
    private int ReaderID;
    private String Name;
    private String Address;
    private String Phone;
    private String Email;
    
    public int getReaderID(){
        return ReaderID;
    }
    
    public void setReaderID(int ReaderID){
        this.ReaderID = ReaderID;
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
    
    public Readers (int ReaderID, String Name, String Address, String Phone, String Email){
        this.ReaderID = ReaderID;
        this.Name = Name;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
    }
}
