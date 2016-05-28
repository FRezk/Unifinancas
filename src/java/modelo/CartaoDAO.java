/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.Cartao;
import dao.Conexao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Jefferson
 */
public class CartaoDAO {
    EntityManager em;
    
    public CartaoDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public Cartao incluir(Cartao obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
            return em.merge(obj);
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
            
        }
        
    }

    public List<Cartao> listar() throws Exception {
        return em.createNamedQuery("Cartao.findAll").getResultList();
    }
    public List<Cartao> listarDesc() throws Exception {
        return em.createNamedQuery("Cartao.findAllDesc").getResultList();
    }
    
    public void alterar(Cartao obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void excluir(Cartao obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            Cartao delete = em.merge(obj);
            em.remove(delete);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            
        } finally {
            em.close();
        }
    }

    public void fechaEmf() {
        Conexao.closeConexao();
    }
}
