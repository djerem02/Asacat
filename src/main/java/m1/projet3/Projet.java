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
    public String parentprofil;
    @Index
    public Integer del;

    public Projet(){}

    public Projet(Long idp, String nom,String parentprofil,Integer del) {
        this.id = idp;
        this.nom = nom;
        this.parentprofil = parentprofil;
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


    public String getParentprofil() {
        return parentprofil;
    }

    public void setParentprofil(String parentprofil) {
        this.parentprofil = parentprofil;
    }

    public Integer getDel() {return del;}

    public void setDel(Integer del) {this.del = del;}
}
