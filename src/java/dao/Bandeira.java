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
 * @author Jefferson
 */
@Entity
@Table(name = "bandeira")
@NamedQueries({
    @NamedQuery(name = "Bandeira.findAll", query = "SELECT b FROM Bandeira b")})
public class Bandeira implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_bandeira")
    private Integer idBandeira;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Column(name = "logo_url")
    private String logoUrl;
    @OneToMany(mappedBy = "idBandeira")
    private List<Cartao> cartaoList;

    public Bandeira() {
    }

    public Bandeira(Integer idBandeira) {
        this.idBandeira = idBandeira;
    }

    public Bandeira(Integer idBandeira, String nome) {
        this.idBandeira = idBandeira;
        this.nome = nome;
    }

    public Integer getIdBandeira() {
        return idBandeira;
    }

    public void setIdBandeira(Integer idBandeira) {
        this.idBandeira = idBandeira;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public List<Cartao> getCartaoList() {
        return cartaoList;
    }

    public void setCartaoList(List<Cartao> cartaoList) {
        this.cartaoList = cartaoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idBandeira != null ? idBandeira.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bandeira)) {
            return false;
        }
        Bandeira other = (Bandeira) object;
        if ((this.idBandeira == null && other.idBandeira != null) || (this.idBandeira != null && !this.idBandeira.equals(other.idBandeira))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.Bandeira[ idBandeira=" + idBandeira + " ]";
    }
    
}
