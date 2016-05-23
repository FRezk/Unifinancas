/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Fernando
 */
@Entity
@Table(name = "tipo_transacao")
@NamedQueries({
    @NamedQuery(name = "TipoTransacao.findAll", query = "SELECT t FROM TipoTransacao t")})
public class TipoTransacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_tipo_transacao")
    private Integer idTipoTransacao;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @OneToMany(mappedBy = "idTipoTransacao")
    private List<Transacao> transacaoList;

    public TipoTransacao() {
    }

    public TipoTransacao(Integer idTipoTransacao) {
        this.idTipoTransacao = idTipoTransacao;
    }

    public TipoTransacao(Integer idTipoTransacao, String nome) {
        this.idTipoTransacao = idTipoTransacao;
        this.nome = nome;
    }

    public Integer getIdTipoTransacao() {
        return idTipoTransacao;
    }

    public void setIdTipoTransacao(Integer idTipoTransacao) {
        this.idTipoTransacao = idTipoTransacao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Transacao> getTransacaoList() {
        return transacaoList;
    }

    public void setTransacaoList(List<Transacao> transacaoList) {
        this.transacaoList = transacaoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoTransacao != null ? idTipoTransacao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoTransacao)) {
            return false;
        }
        TipoTransacao other = (TipoTransacao) object;
        if ((this.idTipoTransacao == null && other.idTipoTransacao != null) || (this.idTipoTransacao != null && !this.idTipoTransacao.equals(other.idTipoTransacao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.TipoTransacao[ idTipoTransacao=" + idTipoTransacao + " ]";
    }
    
}
