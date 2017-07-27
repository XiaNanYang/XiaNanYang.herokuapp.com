$(document).ready ->
  $(window).scroll ->
    if $(this).scrollTop() > 100
      $('#navbar').fadeOut 500
    else
      $('#navbar').fadeIn 500
