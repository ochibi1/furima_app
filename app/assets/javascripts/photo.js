$(function() {
  $('input[type=file]').after('<div class="fileimg" style="display: flex;flex-wrap: wrap;"><div/>');
  let img_count = 1;

  $('input[type=file]').change(function() {
    let file = $(this).prop('files');
    console.log(file);
    $(file).each(function(i) {
      if (img_count > 10) {
        return false;
      }
    
      if (! file[i].type.match('image.*')) {
        alert('この形式のファイルはアップロードできません');
        $(this).val('');
        $('.fileimg').html('');
        return;
      }

      let reader = new FileReader();
      reader.onload = function() {
        let img_src = $('<img style="width: 7rem;height: 7rem;">').attr('src', reader.result);
        let box = $('<div style="margin-bottom: 0.3rem;background: whitesmoke;display: flex;flex-direction: column;justify-content: center;align-items: center;"></div>');
        let box2 =  box.append(img_src).append($('<p class="deletefile" style="margin: 0;padding: 0.2rem;font-size: 0.9rem;color: #4897d8;font-weight: normal;cursor: pointer;">削除</p>'));
        $('.fileimg').append(box2);
      }
      reader.readAsDataURL(file[i]);

      img_count += 1;
      console.log(img_count)
    });
  });

  // $('.deletefile').on('click', function() {

  // });
});