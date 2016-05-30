/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jefferson
 */
public class ConexaoJSP {
    private Connection con;
    
    public ConexaoJSP(){
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://localhost:5432/unifinancas";
        String username = "postgres";
        String password = "root";

        try{
            Class.forName(driver).newInstance();
            this.con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            System.out.print("SQLException: " + ex.getMessage());
            System.out.print("SQLState: " + ex.getSQLState());
            System.out.print("VendorError: " + ex.getErrorCode());
        } catch (InstantiationException ex) {
            Logger.getLogger(ConexaoJSP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ConexaoJSP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection getConnection(){
        return this.con;
    }
}
