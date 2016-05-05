package m1.projet3;

import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;


/**
 * Created by Jérémy on 01/04/2016.
 */

@Entity
@Cache
public class Profil {

    @Id
    public String id;

    @Index
    public String nom;

    @Index
    public String prenom;

    @Index
    public String role;

    @Index
    public String phone;

    @Index
    public String email;


    public Profil(){}

    public Profil(String id, String nom, String prenom, String role, String phone, String email) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.role = role;
        this.phone = phone;
        this.email = email;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {return prenom;}

    public void setPrenom(String prenom) {this.prenom = prenom;}

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
