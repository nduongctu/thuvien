/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duong
 */
public class LibrarianAccounts {

    private int AccountID;
    private int LibrarianID;
    private String Username;
    private String Password;

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getLibrarianID() {
        return LibrarianID;
    }

    public void setLibrarianID(int LibrarianID) {
        this.LibrarianID = LibrarianID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public LibrarianAccounts(int AccountID, int LibrarianID, String Username, String Password) {
        this.AccountID = AccountID;
        this.LibrarianID = LibrarianID;
        this.Username = Username;
        this.Password = Password;
    }
}
