/**
 * Created by Jérémy on 09/05/2016.
 */

/*Modifier le profil*/
var newrole_val = "";

$("#editprofil").on("click", function(e){
    e.preventDefault();
    var datarole = $(("#datarole"));
    var dataprenom = $(("#dataprenom"));
    var datanom = $(("#datanom"));
    var datamail = $(("#datamail"));
    var dataphone = $(("#dataphone"));

    var role_id   = datarole.attr("id");
    var newrole_id   = role_id+"-form";
    var prenom_id   = dataprenom.attr("id");
    var newprenom_id   = prenom_id+"-form";
    var nom_id   = datanom.attr("id");
    var newnom_id   = nom_id+"-form";
    var mail_id   = datamail.attr("id");
    var newmail_id   = mail_id+"-form";
    var phone_id   = dataphone.attr("id");
    var newphone_id   = phone_id+"-form";


    var role_val = datarole.text();
    var prenom_val = dataprenom.text();
    var nom_val = datanom.text();
    var mail_val = datamail.text();
    var phone_val = dataphone.text();

    datarole.empty();
    dataprenom.empty();
    datanom.empty();
    datamail.empty();
    dataphone.empty();


    $('select').material_select();
    $('<div class="file-field input-field">' +
        '<div class="btn"> <span>File</span> <input type="file"> </div>'+
        '<div class="file-path-wrapper"> <input class="file-path validate" type="text"> </div>'+
        '</div>'+
        '<div class="input-field col s12"><select id="'+newrole_id+'" selected="role_val" >'+
        '<option  disabled selected>Rôle</option>'+
        '<option >Product Owner</option>'+
        '<option >Scrum Master</option>'+
        '<option >Développeur</option>'+
        '</select></div>').appendTo(datarole);
    $('<input type="text" name="'+newprenom_id+'" id="'+newprenom_id+'" value="'+prenom_val+'" class="hlite">').appendTo(dataprenom);
    $('<input type="text" name="'+newnom_id+'" id="'+newnom_id+'" value="'+nom_val+'" class="hlite">').appendTo(datanom);
    $('<input type="text" name="'+newmail_id+'" id="'+newmail_id+'" value="'+mail_val+'" class="hlite">').appendTo(datamail);
    $('<input type="text" name="'+newphone_id+'" id="'+newphone_id+'" value="'+phone_val+'" class="hlite">').appendTo(dataphone);
    $(this).css("display", "none");
    $('#saveprofil').css("display","block");
});
/*Valider & Sauvegarder*/
$("#saveprofil").on("click", function(e){
    e.preventDefault();
    $("select").change(function () {

        $("select option:selected").each(function () {
            newrole_val += $(this).text();
            alert(newrole_val+"a");
        });

    })
    var user_id = $(("#user_id")).val();

    var dataprenom = $(("#dataprenom"));
    var datarole = $(("#datarole"));
    var datanom = $(("#datanom"));
    var datamail = $(("#datamail"));
    var dataphone = $(("#dataphone"));


    var newprenom_id   = dataprenom.attr("id");
    var newrole_id   = datarole.attr("id");
    var newnom_id   = datanom.attr("id");
    var newmail_id   = datamail.attr("id");
    var newphone_id   = dataphone.attr("id");

    var role_input  = "#"+newrole_id+"-form";
    var prenom_input  = "#"+newprenom_id+"-form";
    var nom_input  = "#"+newnom_id+"-form";
    var mail_input  = "#"+newmail_id+"-form";
    var phone_input  = "#"+newphone_id+"-form";

    var newrole_input  = $(role_input);
    var newprenom_input  = $(prenom_input);
    var newnom_input  = $(nom_input);
    var newmail_input  = $(mail_input);
    var newphone_input  = $(phone_input);

    var newrole_val  = newrole_input.val();
    var newprenom_val  = newprenom_input.val();
    var newnom_val  = newnom_input.val();
    var newmail_val  = newmail_input.val();
    var newphone_val  = newphone_input.val();

    newrole_input.remove();
    newprenom_input.remove();
    newnom_input.remove();
    newmail_input.remove();
    newphone_input.remove();


    datarole.html(newrole_val);
    dataprenom.html(newprenom_val);
    datanom.html(newnom_val);
    datamail.html(newmail_val);
    dataphone.html(newphone_val);

    $(this).css("display", "none");
    $('#editprofil').css("display","block");

    /*Enregistrer le profil*/
    $.get({
        url:'ProfilServlet',
        datatype:'json',
        data:{user_id:user_id,profil_role:newrole_val,profil_prenom:newprenom_val,profil_nom:newnom_val,profil_email:newmail_val,profil_phone:newphone_val}, ///

    })

});


/*Modifier un sprint */

$(".editsprint").click(function(event){

    event.preventDefault();
    $sprint_id = $(this).parent('h3').attr('id');
    $sprint_nom = $(this).prev('span').text();
    alert($sprint_id);
    alert($sprint_nom);



    $.get({
        url: 'EditServlet',
        datatype: 'json',
        data: {sprint_id: $sprint_id, sprint_nom: $sprint_nom},

    })

    Materialize.toast($sprint_nom + " modifié !", 3000);
})


