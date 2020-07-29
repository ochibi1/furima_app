$(function() {
  $('input[type=file]').after('<div class="fileimg"><div/>');
  let img_count = 1;
  $('input[type=file]').change(function() {
    let file = $(this).prop('files');

    $(file).each(function(i) {
      if (img_count > 10) {
        return false;
      }
    
      if (! file[i].type.match('image.*')) {
        $(this).val('');
        $('.fileimg').html('');
        return;
      }

      let reader = new FileReader();
      reader.onload = function() {
        let img_src = $('<img style="width: 7rem;height: 7rem;">').attr('src', reader.result);
        $('.fileimg').append(img_src);
      }
      reader.readAsDataURL(file[i]);

      img_count += 1;
      console.log(img_count)
    });
  });
});