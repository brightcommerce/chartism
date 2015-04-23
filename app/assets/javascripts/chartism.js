//= require chartist

$(function() {
  $('[data-chartism-url]').each(function() {
    $.getJSON($(this).data('chartism-url'), function(response) {
      new Chartist[response.type]("#" + this.id, response.data, response.options);
    }.bind(this));
  });
});
