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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Fernando
 */
@Entity
@Table(name = "cartao")
@NamedQueries({
    @NamedQuery(name = "Cartao.findAll", query = "SELECT c FROM Cartao c"),
    @NamedQuery(name = "Cartao.findAllDesc", query = "SELECT c FROM Cartao c ORDER BY c.idCartao desc"),
    @NamedQuery(name = "Cartao.findActive", query = "SELECT c FROM Cartao c where c.ativo = 1 ORDER BY c.idCartao desc"),
})
public class Cartao implements Serializable {
    @OneToMany(mappedBy = "idCartao")
    private List<Transacao> transacaoList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_cartao")
    private Integer idCartao;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Column(name = "ativo")
    private Integer ativo;
    @JoinColumn(name = "id_bandeira", referencedColumnName = "id_bandeira")
    @ManyToOne
    private Bandeira idBandeira;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public Cartao() {
    }

    public Cartao(Integer idCartao) {
        this.idCartao = idCartao;
    }

    public Cartao(Integer idCartao, String nome) {
        this.idCartao = idCartao;
        this.nome = nome;
    }

    public Integer getIdCartao() {
        return idCartao;
    }

    public void setIdCartao(Integer idCartao) {
        this.idCartao = idCartao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getAtivo() {
        return ativo;
    }

    public void setAtivo(Integer ativo) {
        this.ativo = ativo;
    }

    public Bandeira getIdBandeira() {
        return idBandeira;
    }

    public void setIdBandeira(Bandeira idBandeira) {
        this.idBandeira = idBandeira;
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
        hash += (idCartao != null ? idCartao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cartao)) {
            return false;
        }
        Cartao other = (Cartao) object;
        if ((this.idCartao == null && other.idCartao != null) || (this.idCartao != null && !this.idCartao.equals(other.idCartao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.Cartao[ idCartao=" + idCartao + " ]";
    }

    public List<Transacao> getTransacaoList() {
        return transacaoList;
    }

    public void setTransacaoList(List<Transacao> transacaoList) {
        this.transacaoList = transacaoList;
    }
    
}
