package m1.projet3;

import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

/**
 * Created by Jérémy on 06/04/2016.
 */

@Entity
@Cache
public class Sprint {


    @Id
    public Long id;


    public String valeur;


    public String etat;

    @Index
    public String nom;


    public String userstory;

    @Index
    public Integer del;

    public Sprint(){}

    public Sprint(String nom,String valeur,String etat,Integer del,String userstory){
        this.nom=nom;
        this.valeur=valeur;
        this.etat=etat;
        this.del=del;
        this.userstory=userstory;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
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

    public Integer getDel() {return del;}

    public void setDel(Integer del) {this.del = del;}

    public String getUserstory() {
        return userstory;
    }

    public void setUserstory(String userstory) {
        this.userstory = userstory;
    }
}
