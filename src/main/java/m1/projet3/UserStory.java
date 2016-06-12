package m1.projet3;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

/**
 * Created by Jérémy on 08/04/2016.
 */

@Entity
@Cache
public class UserStory {

    @Parent
    Key<Sprint> theSprint;

    @Id
    public Long id;

    @Index
    public String nom;

    @Index
    public String valeur;

    @Index
    public Integer del;

    public String description;


    public String etat;


    public Integer priorite;

    @Index
    public String parentsprint;



    public UserStory(){}
    public UserStory(String id_sprint, String nom) {
        this();
        if ( id_sprint != null ) {
            theSprint = Key.create(Sprint.class, id_sprint);  // Creating the Ancestor key
        } else {
            theSprint = Key.create(Sprint.class, "default");
        }
        this.nom = nom;
    }
    public UserStory(String nom,String valeur,String description,String etat,Integer priorite,Integer del,String parentsprint){
        this.nom=nom;
        this.valeur=valeur;
        this.description=description;
        this.etat=etat;
        this.priorite=priorite;
        this.del=del;
        this.parentsprint=parentsprint;
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

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPriorite() {
        return priorite;
    }

    public void setPriorite(Integer priorite) {
        this.priorite = priorite;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Integer getDel() {return del;}

    public void setDel(Integer del) {this.del = del;}

    public String getParentsprint() {
        return parentsprint;
    }

    public void setParentsprint(String parentsprint) {
        this.parentsprint = parentsprint;
    }
}
