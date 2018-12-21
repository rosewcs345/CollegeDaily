// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function showDiv(elem){
   if(elem.value == "Study Event"){
      document.getElementById('study_event_form').style.display = "block";
      document.getElementById('club_event_form').style.display = "none";
      document.getElementById('activity_event_form').style.display = "none";
   }
   else if(elem.value == "Club Event"){
     document.getElementById('study_event_form').style.display = "none";
     document.getElementById('club_event_form').style.display = "block";
     document.getElementById('activity_event_form').style.display = "none";
   }
   else if(elem.value == "Activity Event"){
     document.getElementById('study_event_form').style.display = "none";
     document.getElementById('club_event_form').style.display = "none";
     document.getElementById('activity_event_form').style.display = "block";
   }
   else{
      document.getElementById('study_event_form').style.display = "none";
      document.getElementById('club_event_form').style.display = "none";
      document.getElementById('activity_event_form').style.display = "none";
   }
}
