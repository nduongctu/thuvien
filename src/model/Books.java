/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duong
 */
public class Books {
    private int BookID;
    private String Title;
    private String Author;
    private String Publisher;
    private String Description;
    private String Category;
    private String Status;
    
    public int getBookID(){
        return BookID;
    }
    
    public void setBookID(int BookID){
        this.BookID = BookID;
    }
    
   public String getTitle(){
       return Title;
   }
   
   public void setTitle(String Title){
       this.Title = Title;
   }
   
      public String getAuthor(){
       return Author;
   }
   
   public void setAuthor(String Author){
       this.Author = Author;
   }
   
   public String getPublisher(){
       return Publisher;
   }
   
   public void setPublisher(String Publisher){
       this.Publisher = Publisher;
   }

   public String getDescription(){
       return Description;
   }
   
   public void setDescription(String Description){
       this.Description = Description;
   }
   
   public String getCategory(){
       return Category;
   }
   
   public void setCategory(String Category){
       this.Category = Category;
   }   
   
   public String getStatus(){
       return Status;
   }
   
   public void setStatus(String Status){
       this.Status = Status;
   }

    public Books (int BookID, String Title, String Author, String Publisher, String Description, String Category, String Status){
        this.BookID = BookID;
        this.Title = Title;
        this.Author = Author;
        this.Publisher = Publisher;
        this.Description = Description;
        this.Category = Category;
        this.Status = Status;
    }
}