$(document).ready(function() {

  $('#login').click(function(e){
    e.preventDefault();
    $.ajax({
      success: function(){
        $("#login_hide").show();
        $("#sign_up_hide").hide();
        $("#log_out").show();
      }
    })
})

  $('#sign_up').click(function(e){
    e.preventDefault();
    $.ajax({
      success: function(){
        $("#sign_up_hide").show();
        $("#login_hide").hide();
      }
    })
})

  var fullHide = function(){
    $("#sign_up_hide").hide();
        $("#sign_up").hide();
        $("#login_hide").hide();
        $("#login").hide();
        $("#log_out").show();
  }

$('#sign_up_submit').click(function(e){
    e.preventDefault();
    $.ajax({
      type: 'POST'
      , url: '/sign_up'
      , data: $('form').serialize()
      , success: function(data){
        console.log(data);
        fullHide();
      }
      , fail: function(data){
        console.log('i failed');
      }
    })
})

  $('#login_submit').click(function(e){
    e.preventDefault();
    $.ajax({
         type: 'POST'
      , url: '/login'
      , data: $('form').serialize()
      , success: function(data){
         fullHide();
      }
      , failure: function(){
        console.log('i failed')
      }
    })
})








});
