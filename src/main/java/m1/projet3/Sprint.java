package m1.projet3;

import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * Created by Jérémy on 06/04/2016.
 */

@Entity
public class Sprint {

    @Id
    public Long id;

    @Index
    public Integer valeur;

    @Index
    public String etat;

    @Index
    public String nom;

    @Index
    public Integer userstory;

    public Sprint(){}

    public Sprint(String nom,Integer valeur,String etat,Integer userstory){
        this.nom=nom;
        this.valeur=valeur;
        this.etat=etat;
        this.userstory=userstory;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getValeur() {
        return valeur;
    }

    public void setValeur(Integer valeur) {
        this.valeur = valeur;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getUserstory() {
        return userstory;
    }

    public void setUserstory(Integer userstory) {
        this.userstory = userstory;
    }
}
