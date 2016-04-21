package m1.projet3;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * Created by Jérémy on 08/04/2016.
 */

@Entity
public class UserStory {

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




    public UserStory(){}

    public UserStory(String nom,Integer valeur,String description,String etat,String priorite){
        this.nom=nom;
        this.valeur=valeur;
        this.description=description;
        this.etat=etat;
        this.priorite=priorite;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPriorite() {
        return priorite;
    }

    public void setPriorite(String priorite) {
        this.priorite = priorite;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }
}
