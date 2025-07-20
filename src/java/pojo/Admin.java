/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

/**
 *
 * @author dell
 */
public class Admin {
    private String Aname;
    private String password;
    private String Email;
    private int MobNo;
    
    public Admin(String Aname, String password) {
        this.Aname = Aname;
        this.password = password;
//        this.Email = Email;
//        this.MobNo = MobNo;
         
    }
    
    public Admin() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public String getAname(){
        return Aname;
    }
    public String getPassword(){
        return password;
    }
    public String getEmail(){
        return Email;
    }
    public int getMobNo(){
        return MobNo;
    }
}
