/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

/**
 *
 * @author dell
 */
public class User {
    private String Uname;
    private String password;
    private String Email;
    private int Age;
    private long MobNo;
    
    public User(String Uname, String password, String Email, int Age, long MobNo) {
        this.Uname = Uname;
        this.password = password;
        this.Email = Email;
        this.Age = Age;
        this.MobNo = MobNo;
         
    }
    public User() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public String getUname(){
        return Uname;
    }
    public String getPassword(){
        return password;
    }
    public String getEmail(){
        return Email;
    }
    public int getAge(){
        return Age;
    }
    public long getMobNo(){
        return MobNo;
    }
}
