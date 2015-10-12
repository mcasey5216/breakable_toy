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
//= require foundation
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require underscore
//= require gmaps/google
//= require_tree .

$(function(){
  $(document).foundation('tab', 'reflow');

  // checkin field set on new page
  $('.checkin-contact select, .checkin-contact input').attr("disabled", "true");
  $('.checkin-contact').addClass("disable-field-set");

  $('.checkin-contact').click(function(){
    $('.checkin-local').addClass("disable-field-set");
    $('.checkin-contact').removeClass("disable-field-set");
    $('.checkin-local input').attr("disabled", "true");
    $('.checkin-contact select, .checkin-contact input').removeAttr("disabled");
  });

  $('.checkin-local').click(function(){
    $('.checkin-contact').addClass("disable-field-set");
    $('.checkin-local').removeClass("disable-field-set");
    $('.checkin-local input').removeAttr("disabled")
    $('.checkin-contact select, .checkin-contact input').attr("disabled", "true");
  });


  // group show page side bar
  $("#side-user li").hover(function(){
    /* This is the same for all */
    $(".pop-up").removeClass("hide");
    var popUpOffSet = $(this).offset();
    popUpOffSet.left += $(this).width();
    $(".pop-up").offset(popUpOffSet);
    var popUpData = JSON.parse($(this).attr("meta-data"));
    /* This is the same for all */

    /* This is the different base on json object for all */
    wrapperDiv = document.createElement("div");
    nameDiv = document.createElement("div");
    nameDiv.innerHTML = popUpData.first_name + " " + popUpData.last_name;
    emailDiv = document.createElement("div");
    emailDiv.innerHTML = popUpData.email;
    wrapperDiv.appendChild(nameDiv);
    wrapperDiv.appendChild(emailDiv);
    /* This is the different base on json object for all */


    /* This is the same for all */
    $("#pop-up-content").html(wrapperDiv);
    /* This is the same for all */
  });

  $('.side-bar').mouseleave(function() {
    $(".pop-up").addClass("hide");
  });

  $("#search").keyup(function() {
    //debugger;
    var query = $(this).val();
    var userList = $("#all-users li")

    for(var x = 0; x < userList.length; x++){
      var userName = $(userList[x]).find("[type='submit']").attr('value')
      if (userName.indexOf(query) <= -1) {
        $(userList[x]).addClass('hide')
      } else {
        $(userList[x]).removeClass('hide')
      }

    }
  });
});
