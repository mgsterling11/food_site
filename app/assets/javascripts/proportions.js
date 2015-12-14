$(function(){
 
 /// New Form
$(document).on('click', '.add-proportion', function(event){
    event.preventDefault();
      var value = $('.proportion-item').find('input:text').length / 3
      var html_to_clone = $('.proportion-item').find('input:text').slice(0,3)
      var html = $(html_to_clone).clone();
      html.each(function(index, proportion_piece) {
        proportion_piece_remove_val = $(proportion_piece).val("")
        proportion_piece = $(proportion_piece_remove_val).attr('value', "")
        new_proportion_piece = proportion_piece[0].outerHTML.replace(/\d+/g, value);    
        $('.proportions-list').append($(new_proportion_piece));
      });
  });

$(document).on("keypress", '.proportion-item', function(event) {
    return event.keyCode != 13;
  });

 /// Edit Form

  function resetPlaceholder () {
    $('.quantity-input-js').attr("placeholder", 'Quantity')
  };


  $(document).on('ajax:success', '.edit-proportion-js', function(e, data, status, xhr){
    if (data.action == 'update') {
      $(this).parent().children('.proportion-js').html(data.template);
      $(this).addClass('hide');
      $(this).parent().children('.proportion-js').removeClass('hide');
    } else {
      $(this).parent().parent().html(data.template);
    }
  });

  $(document).on('keypress', '.quantity-input-js', function(e) {
    if (e.which != 8 && e.which != 0 && e.which !='47' && e.which != '46' && e.which != '32' && (e.which < 48 || e.which > 57)) {
        $(this).attr("placeholder", 'Digits Only');
        setTimeout(resetPlaceholder, 1000);
               return false;
    }
  })

  $(document).on('dblclick', '.proportion-list-js', function() {
    $(this).children('.edit-proportion-js').removeClass('hide')
    $(this).children('.proportion-js').addClass('hide')
  })

  $(document).on('ajax:success', '.add-proportion-from-show-js', function(e, data, status, xhr){
    var quantity = data.quantity;
    var unit = data.unit;
    var ingredient = data.ingredient;
    var cloned_proportion = $('.proportion-js').clone().get(0);
    var proportion_html = $(cloned_proportion).find('li').text(data.quantity + " " + data.unit + " " + data.ingredient);
    $('.proportion-show-partial-js').append($(proportion_html));
    $('li').last().wrap("<ul class='proportion-list-js'><div class='proportion-js'></div></ul>");
    var form_fields = $('.add-proportion-from-show-js').find('input:text');
    form_fields.first().val("");
    $(form_fields.get(1)).val("");
    form_fields.last().val("");
  });

  $(document).on('click', '.display-add-ingredient-form-js', function(){
    $('.add-proportion-from-show-js').removeClass('hide')
  });

})
