/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Fernando
 */
@Entity
@Table(name = "plano_contas")
@NamedQueries({
    @NamedQuery(name = "PlanoContas.findAll", query = "SELECT p FROM PlanoContas p")})
public class PlanoContas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_plano_contas")
    private Integer idPlanoContas;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario idUsuario;

    public PlanoContas() {
    }

    public PlanoContas(Integer idPlanoContas) {
        this.idPlanoContas = idPlanoContas;
    }

    public PlanoContas(Integer idPlanoContas, String nome) {
        this.idPlanoContas = idPlanoContas;
        this.nome = nome;
    }

    public Integer getIdPlanoContas() {
        return idPlanoContas;
    }

    public void setIdPlanoContas(Integer idPlanoContas) {
        this.idPlanoContas = idPlanoContas;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPlanoContas != null ? idPlanoContas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PlanoContas)) {
            return false;
        }
        PlanoContas other = (PlanoContas) object;
        if ((this.idPlanoContas == null && other.idPlanoContas != null) || (this.idPlanoContas != null && !this.idPlanoContas.equals(other.idPlanoContas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.PlanoContas[ idPlanoContas=" + idPlanoContas + " ]";
    }
    
}
