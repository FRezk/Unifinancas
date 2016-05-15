/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Alex
 */
public  class Conexao {
    
    private static EntityManagerFactory emf;
    
    private Conexao() {

    }

    public static EntityManagerFactory getConexao() throws Exception {
        if ((emf == null) || (!emf.isOpen())) {
             emf = Persistence.createEntityManagerFactory("UnifinancasPU");
        }
        return emf;
    }  
    
    /**
     *
     */
    public static void closeConexao(){
        if (emf.isOpen()){
           emf.close();
        }
    }
}
