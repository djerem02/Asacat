package m1.projet3;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * Created by Jérémy on 23/04/2016.
 */
@Entity
public class Tache {

    @Id
    public Long id;

    @Index
    public String nom;

    @Index
    public Integer valeur;

    @Index
    public String description;

    @Index
    public String etat;

    @Index
    public String priorite;

    @Index
    public String temps_estim;

    @Index
    public String temps_dev;

    public Tache(){}

    public Tache(String nom,Integer valeur,String description,String etat,String priorite,String temps_estim,String temps_dev){
        this.nom=nom;
        this.valeur=valeur;
        this.description=description;
        this.etat=etat;
        this.priorite=priorite;
        this.temps_estim=temps_estim;
        this.temps_dev=temps_dev;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getValeur() {
        return valeur;
    }

    public void setValeur(Integer valeur) {
        this.valeur = valeur;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getPriorite() {
        return priorite;
    }

    public void setPriorite(String priorite) {
        this.priorite = priorite;
    }

    public String getTemps_estim() {
        return temps_estim;
    }

    public void setTemps_estim(String temps_estim) {
        this.temps_estim = temps_estim;
    }

    public String getTemps_dev() {
        return temps_dev;
    }

    public void setTemps_dev(String temps_dev) {
        this.temps_dev = temps_dev;
    }

}
