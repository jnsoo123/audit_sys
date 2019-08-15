// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .


  $(document).on('turbolinks:load', function(){
    $('[data-toggle="tooltip"]').tooltip()

    $('.datepicker').datepicker({
      format: 'dd/mm/yyyy'
    })

    dynamicBackgroundColor()
  })

function dynamicBackgroundColor() {
  var $items = $('.items-index .badge, .categories-index .badge')

  $items.map(function(i, item){
    console.log(item)
    var rgb = $(item).css('background-color')

    if (rgb.match(/^rgb/)) {
      var a = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/)
      var r = a[1]
      var g = a[2]
      var b = a[3]
    }

    var hsp = Math.sqrt(
      0.299 * (r * r) +
      0.587 * (g * g) +
      0.114 * (b * b)
    )

    if (hsp > 127.5) {
      $(item).css('color', '#000');
    } else {
      $(item).css('color', '#fff');
    }
  })
}
