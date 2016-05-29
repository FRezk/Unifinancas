/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.Conexao;
import dao.Transacao;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

/**
 *
 * @author Jefferson
 */
public class TransacaoDAO {
    EntityManager em;
    
    public TransacaoDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Transacao obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
            
        }
        
    }

    public List<Transacao> listar() throws Exception {
        return em.createNamedQuery("Transacao.findAll").getResultList();
    }
    public List<Transacao> listarDesc() throws Exception {
        return em.createNamedQuery("Transacao.findAllDesc").getResultList();
    }
    
    public List<Transacao> gastoPorCategoria() throws Exception {
        Query query = em.createNativeQuery("Select id_categoria, count(*), sum(valor) as total From transacao Where id_tipo_transacao = 1 Group By id_categoria");
        return query.getResultList();
    }
    
    public void alterar(Transacao obj) throws Exception {
        
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
    
    public void excluir(Transacao obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
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
