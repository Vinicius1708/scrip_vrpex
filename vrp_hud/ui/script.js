$(document).ready(function(){
  var $debug = $("#debug");
  var $heal = $("#heal");
  var $box = $("#box");
  var $boxArmor = $("#armor");
  $(".GaugeMeter").gaugeMeter();

  window.addEventListener('message', function(event){
    if ( event.data.display == true ) {
      $('#hud').fadeIn();
      $('body').show();
    }   
    else {
      $('#hud').fadeOut();
    }
    if ( event.data.incar == true ) {
      $('.hud-player').css('background','url(img/barra_Esquerda.png) no-repeat');
      $('.hud-player').css('width','220px');
      $('.hud-player').css('right','3%');
      $("#velocimetro").fadeIn(1500);
    }   
    else {
      
      $('.hud-player').css('background','url(img/barra_Esquerda.png) no-repeat');
      $('.hud-player').css('width','220px');
      $('.hud-player').css('right','46.5%');
      $("#velocimetro").fadeOut(10);
    }
    if ( event.data.cinto == true ) {
      $('.cinto-icongreen').css('display', 'block');    
      $('.cinto-iconred').css('display', 'none'); 
    }   
    else {
      $('.cinto-iconred').css('display', 'block');
      $('.cinto-icongreen').css('display', 'none'); 
    }
    $("#gas").gaugeMeter({percent:event.data.gas});
    $("#rpm").gaugeMeter({percent:event.data.rpm*100});
    $("#kmph").html('<span class="velocidade">'+event.data.speed+'</span></br>');
    
    $boxArmor.css("width", (event.data.armor)+"%");
    $heal.css("width", (event.data.heal)+"%");
    if ( event.data.gas > 20 ) {
      $('.gasDiv').css('background-image','url(img/gasolina0.png)');
      $('.gasDiv').removeClass('gasReserva');
      $('#gas').removeClass('gasReserva');
    }   
    else {
      $('.gasDiv').css('background-image','url(img/gasolina.png)');
      $('.gasDiv').addClass('gasReserva');
      $('#gas').addClass('gasReserva');
    }    
  }); 
});