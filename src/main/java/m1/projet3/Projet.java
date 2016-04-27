package m1.projet3;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * Created by Jérémy on 08/04/2016.
 */
@Entity
@Cache
public class Projet {
    @Id
    public Long id;

    @Index
    public String nom;

    @Index
    public Integer del=0;

    public Projet(){}

    public Projet(Long id, String nom,Integer del) {
        this.id = id;
        this.nom = nom;
        this.del= del;
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

    public Integer getDel() {return del;}

    public void setDel(Integer del) {this.del = del;}
}
