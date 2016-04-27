$(document).ready(function(){

	//Ajouter un Projet
	$("#add_projet").on("click", function(e){
		var copie = $('#projet').clone();
		copie.attr("id","salutcowboy");
		copie.insertBefore($('#add_projet'));
	});




	/*Modifier le profil*/
	$(".editlink").on("click", function(e){
	  e.preventDefault();
		var dataset = $(this).prev(".datainfo");
		var savebtn = $(this).next(".savebtn");
		var theid   = dataset.attr("id");
		var newid   = theid+"-form";
		var currval = dataset.text();

		dataset.empty();
		
		$('<input type="text" name="'+newid+'" id="'+newid+'" value="'+currval+'" class="hlite">').appendTo(dataset);
		
		$(this).css("display", "none");
		savebtn.css("display", "inline-block");
	});
	$(".savebtn").on("click", function(e){
		e.preventDefault();
		var elink   = $(this).prev(".editlink");
		var dataset = elink.prev(".datainfo");
		var newid   = dataset.attr("id");
		
		var cinput  = "#"+newid+"-form";
		var einput  = $(cinput);
		var newval  = einput.val();
		
		$(this).css("display", "none");
		einput.remove();
		dataset.html(newval);
		
		elink.css("display", "inline-block");
	});

	/*Enregistrer le Profil*/
	$profil_nom=$("#nom").val();
	$profil_email=$("#email").text();
	//$profil_prenom=$("#task1").text();
	//$profil_phone=$("#").text();


	/*
	$.get({
	 url:'ProfilServlet',
	 datatype:'json',
	 data:{profil_nom:$profil_nom,profil_email:$profil_email},

	 });*/
});

