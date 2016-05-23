/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Jefferson
 */
@Entity
@Table(name = "transacao")
@NamedQueries({
    @NamedQuery(name = "Transacao.findAll", query = "SELECT t FROM Transacao t")})
public class Transacao implements Serializable {

    @JoinColumn(name = "id_tipo_transacao", referencedColumnName = "id_tipo_transacao")
    @ManyToOne
    private TipoTransacao idTipoTransacao;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "valor")
    private Double valor;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_transacao")
    private Integer idTransacao;
    @Column(name = "descricao")
    private String descricao;
    @Basic(optional = false)
    @Column(name = "dttransacao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dttransacao;
    @Basic(optional = false)
    @Column(name = "tipo_pagamento")
    private int tipoPagamento;
    @JoinColumn(name = "id_cartao", referencedColumnName = "id_cartao")
    @ManyToOne
    private Cartao idCartao;
    @JoinColumn(name = "id_categoria", referencedColumnName = "id_categoria")
    @ManyToOne
    private Categoria idCategoria;
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne
    private Usuario idUsuario;

    public Transacao() {
    }

    public Transacao(Integer idTransacao) {
        this.idTransacao = idTransacao;
    }

    public Transacao(Integer idTransacao, Date dttransacao, int tipoPagamento) {
        this.idTransacao = idTransacao;
        this.dttransacao = dttransacao;
        this.tipoPagamento = tipoPagamento;
    }

    public Integer getIdTransacao() {
        return idTransacao;
    }

    public void setIdTransacao(Integer idTransacao) {
        this.idTransacao = idTransacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }


    public Date getDttransacao() {
        return dttransacao;
    }

    public void setDttransacao(Date dttransacao) {
        this.dttransacao = dttransacao;
    }

    public int getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(int tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public Cartao getIdCartao() {
        return idCartao;
    }

    public void setIdCartao(Cartao idCartao) {
        this.idCartao = idCartao;
    }

    public Categoria getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Categoria idCategoria) {
        this.idCategoria = idCategoria;
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
        hash += (idTransacao != null ? idTransacao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transacao)) {
            return false;
        }
        Transacao other = (Transacao) object;
        if ((this.idTransacao == null && other.idTransacao != null) || (this.idTransacao != null && !this.idTransacao.equals(other.idTransacao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dao.Transacao[ idTransacao=" + idTransacao + " ]";
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public TipoTransacao getIdTipoTransacao() {
        return idTipoTransacao;
    }

    public void setIdTipoTransacao(TipoTransacao idTipoTransacao) {
        this.idTipoTransacao = idTipoTransacao;
    }
    
}
