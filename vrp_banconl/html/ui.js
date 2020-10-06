function addGaps(nStr) {
  nStr += '';
  var x = nStr.split('.');
  var x1 = x[0];
  var x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
  }
  return x1 + x2;
}

function addCommas(nStr) {
  nStr += '';
  var x = nStr.split('.');
  var x1 = x[0];
  var x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + '.<span style="margin-left: 0px; margin-right: 1px;"/>' + '$2');
  }
  return x1 + x2;
}

$(document).ready(function() {
  window.addEventListener('message', function(event) {
      var item = event.data;
     
      $('.identidade').html(event.data.identidade);
      $('.checarmultas').html(event.data.multasbalance);

      if (item.updateBalance == true) {
          $('.currentBalance').html(' ' + addCommas(event.data.balance));
          $('.dinheirocarteira').html(event.data.walletbalance);
          $('.multasbalance').html(event.data.multasbalance);
          $('.username').html(event.data.player);
      }

      if (item.openBank == true) {
          $(".container").fadeIn();

          let banco_data = item.banco
          for (let item in banco_data) {
              $("#extrato").append(`
              <div class="margin">
                  <div class="card-content__title">Extrato (` + banco_data[item].data + `)</div>
                  <div class="card-content__value"><span>` + banco_data[item].extrato + `</span></div>
              </div>
            `);
          }
      }

      if (item.openBank == false) {
          $(".container").fadeOut();
          $(".multa").fadeOut();
          $('#extrato').html('')
          $('.modal').css('display', 'none');
          $('.blur').css('filter', 'blur(0)');
          $('.box-acoes').css('opacity', '1');
          $('.input-modal').fadeOut();
      }
  });

  document.onkeyup = function(data) {
      if (data.which == 27) {
          $.post('http://vrp_banconl/close', JSON.stringify({}));
      }
  };
  $("#SaqueRapido").click(function() {
      $.post('http://vrp_banconl/quickCash', JSON.stringify({}));
  });

  $("#sacar").submit(function(e) {
      e.preventDefault();
      $.post('http://vrp_banconl/withdrawSubmit', JSON.stringify({
          amount: $("#sacar #amount").val()
      }));
      $("#sacar #amount").prop('disabled', true)
      setTimeout(function() {
          $("#sacar #amount").prop('disabled', false)
          $("#sacar #submit").css('display', 'block')
      }, 2000)

      $("#sacar #amount").val('')
      $('modal').fadeOut();
      $('.multa').fadeOut();
  });
  $("#botao1").click(function(e){
      e.preventDefault();
      multa = $('.valorMulta').val();
      if (  multa <= 0 || multa == null ){
      $.post('http://vrp_banconl/erroMulta2', JSON.stringify({
      }));
    
      }else{

      $.post('http://vrp_banconl/pagarMulta', JSON.stringify({ 
        amount: $(".valorMulta").val()
       }));
       $('.valorMulta').val('');
    }
  })
  $("#botao2").click(function(e){
    e.preventDefault();
    $('.valorMulta').val('');
})
$("#botao2a").click(function(e){
    e.preventDefault();
    $('.valorMulta').val('');
})

  $("#depositar").submit(function(e) {
      e.preventDefault();
      $.post('http://vrp_banconl/depositSubmit', JSON.stringify({
          amount: $("#depositar #amount").val()
      }));
      $("#depositar #amount").prop('disabled', true)
      setTimeout(function() {
          $("#depositar #amount").prop('disabled', false)
          $("#depositar #submit").css('display', 'block')
      }, 2000)
      $("#depositar #amount").val('')
      $('modal').fadeOut();
      $('.multa').fadeOut();
  });

  $("#trans").submit(function(e) {
      e.preventDefault();
      $.post('http://vrp_banconl/transferSubmit', JSON.stringify({
          amount: $("#trans #amount").val(),
          toPlayer: $("#trans #toPlayer").val()
      }));
      $("#trans #amount").prop('disabled', true)
      $("#trans #toPlayer").prop('disabled', true)
      setTimeout(function() {
          $("#trans #amount").prop('disabled', false)
          $("#trans #submit").css('display', 'block')
          $("#trans #toPlayer").prop('disabled', false)
      }, 2000)
      $("#trans #amount").val('')
      $("#trans #toPlayer").val('')
      $('modal').fadeOut();
      $('.multa').fadeOut();
  });

});