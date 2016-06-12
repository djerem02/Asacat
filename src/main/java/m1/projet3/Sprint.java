package m1.projet3;

import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

import java.util.Date;

/**
 * Created by Jérémy on 06/04/2016.
 */

@Entity
@Cache
public class Sprint {

    @Id
    public Long id_sprint;


    public String valeur;


    public String etat;

    @Index
    public String nom;

    @Index
    public Date creadate;

    @Index
    public String parentprojet;

    @Index
    public Integer del;

    public Sprint(){}


    public Sprint(String nom,String valeur,String etat,Integer del,Date creadate,String parentprojet){
        this.nom=nom;
        this.valeur=valeur;
        this.etat=etat;
        this.creadate=creadate;
        this.del=del;
        this.parentprojet=parentprojet;
    }

    public Long getId() {
        return id_sprint;
    }
    public void setId(Long id) {
        this.id_sprint = id;
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

    public Date getCreadate() {return creadate;}
    public void setCreadate(Date creadate) {this.creadate = creadate;}

    public Integer getDel() {return del;}
    public void setDel(Integer del) {this.del = del;}

    public String getParentprojet() {
        return parentprojet;
    }
    public void setParentprojet(String parentprojet) {
        this.parentprojet = parentprojet;
    }
}
