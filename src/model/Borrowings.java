/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Duong
 */
public class Borrowings {
    private int BorrowID;
    private Date BorrowDate;
    private Date ReturnDate;
    private String Latefee;
    private int BookID;
    private int ReaderID;
    
    public int getBorrowID(){
        return BorrowID;
    }
    
    public void setBorrowID(int BorrowID){
        this.BorrowID = BorrowID;
    }
    
    public int getBookID(){
        return BookID;
    }
    
    public void setBookID(int BookID){
        this.BookID = BookID;
    }

    public int getReaderID(){
        return ReaderID;
    }
    
    public void setReaderID(int ReaderID){
        this.ReaderID = ReaderID;
    }    
    public Date getBorrowDate(){
        return BorrowDate;
    }
    
    public void setBorrowDate(Date BorrowDate){
        this.BorrowDate = BorrowDate;
    }
    
    public Date getReturnDate(){
        return ReturnDate;
    }
    
    public void setReturnDate(Date ReturnDate){
        this.ReturnDate = ReturnDate;
    }
    
    public String getLatefee(){
        return Latefee;
    }
    
    public void setLatefee(String Latefee){
        this.Latefee = Latefee;
    }
    
    public Borrowings(int BorrowID, int BookID, int ReaderID, Date BorrowDate, Date ReturnDate, String Latefee){
        this.BorrowID = BorrowID;
        this.BookID = BookID;
        this.ReaderID = ReaderID;
        this.BorrowDate = BorrowDate;
        this.ReturnDate = ReturnDate;
        this.Latefee = Latefee;
    }
}