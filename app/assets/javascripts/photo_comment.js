$(function() {
// 前提として、画像投稿欄のinput要素はdisplay: none;で非表示にされてあり、ユーザーは一切触る事ができない状態


// img_countはプレビュー画像の数、img_indexはinput要素の name="product[photos_attributes][0][image]" の0などの数字を表す
// プレビューの数に合わせてimg_countは変化し、input要素が1個増える、または減るごとにimg_indexは無限に1増え続ける

// $('.ProductsNew__main__form__group__field__file-input__prevbox__image').lengthは、プレビュー画像が入っているdiv要素の個数
// 編集画面では最初から複数のプレビュー画像が存在するため、その数をあらかじめプラスしてある
  img_count = 0 + $('.ProductsNew__main__form__group__field__file-input__prevbox__image').length
  img_index = 0

  // input要素は全てクリックできないため、input要素に関連づいたlabel要素をクリックするとイベント発火
  // 加えて、inputに画像ファイルが入った場合に発火する二重条件
  $('.file-label').on('click', function() {
    $('.fileinput').change(function() {

  // $(this)だとinput要素を取得してしまうので、#filesの子要素からlabelを取得
  // プレビュー用にinput内のファイルデータを取得したいので、prop('files')[0]を使いデータを取得
      let label = $('#files').find('label')
      let file = $(this).prop('files')[0];

  // データが画像かどうかで、条件分岐
      if (! file.type.match('image.*')) {

  // 画像ファイルでない場合はアラートを表示し、input要素を削除(画像以外のデータであってもコントローラーに送られる値としてinput要素内には保存されている。 input要素が非表示でこれを変更・削除する操作ができないため、input要素ごと削除する必要がある)
        alert('この形式のファイルはアップロードできません');
        $(this).remove();

  // label(↑で定義したlabel変数)のfor属性を"filearea0"から"filearea1"に変更
  // 次に、name="product[photos_attributes][1][image]"、id="filearea1"、class="fileinput fileinput1 に変更されたinput要素を新しく追加
  // input要素1つにつき1つのデータしか入れられないので、画像を選択するたびに1個ずつ、最大10個のinput要素を準備する必要がある

  // 1組のlabelとinputを関連付けるには、labelのfor属性とinputのidを同値にする必要があるため、画像が選択された時点でimg_indexを利用し次のペアを作成する
  // inputは毎回新しいものが必要だが、labelはfor属性のみを変えれば再利用できるので、このような処理を実装した
  // まとめると、このページの画像用input要素はデータが一度入力された時点で再利用不可能なので、次のデータ入力には新しいinputを用意する必要がある
        label.attr('for', `filearea${img_index + 1}`);
        label.before(`<input name="product[photos_attributes][${img_index + 1}][image]" id="filearea${img_index + 1}" type="file" class="fileinput fileinput${img_index + 1}" style="display: none;">`);

  // 次回用にimg_indexの値を+1しておく
        img_index += 1
        return;
      } else {
  // 正しく画像データが入力された場合

  // readerおよびresultは、プレビュー画像表示のために必要な変数定義とメソッド
        let reader = new FileReader();
        reader.onload = function() {

  // input要素に入力されたファイルからプレビュー画像そのものを作成
          let img_src = $('<img style="width: 7rem;height: 7rem;">').attr('src', reader.result);

  // <div> <img><p> </div>の構成でプレビュー画像と削除ボタンの入ったdivを、【クリックしてアップロード】の下に存在するdivの中に追加
  // プレビューを削除した時にinputも同時に削除するために、プレビュー画像のdivとinputのclass名が同じになるようimg_indexを利用
          let box = $(`<div class="fileinput${img_index - 1}" style="margin-bottom: 0.3rem;background: whitesmoke;display: flex;flex-direction: column;justify-content: center;align-items: center;"></div>`);
          let box2 =  box.append(img_src).append('<p class="deletefile" style="margin: 0;padding: 0.2rem;color: #4897d8;font-size: 0.9rem;font-weight: normal;cursor: pointer;">削除</p>');
          $('.ProductsNew__main__form__group__field__file-input__prevbox').append(box2);
        }

  // readAsDataURLはプレビュー表示のためのメソッド
        reader.readAsDataURL(file);

  // ここはif文最初の分岐と同様
        label.attr('for', `filearea${img_index + 1}`);
        label.before(`<input name="product[photos_attributes][${img_index + 1}][image]" id="filearea${img_index + 1}" type="file" class="fileinput fileinput${img_index + 1}" style="display: none;">`);

  // プレビュー画像が1個増えたので、img_countを+1
  // img_indexは処理1回につき必ず1増加(input要素は毎回新しいものを用意するため、減らす必要がない)
        img_count += 1
        img_index += 1

  // img_countはプレビュー画像の数を表すので、10になったらアップロードボタンを非表示にする
        if (img_count == 10) {
          label.attr('style', 'display: none;');
        }
      }
    });
  });


  // プレビュー画像の削除ボタン

  // ページ内で新しく作成された要素はイベント発火に認識されない事があり、今回はそれに当てはまる
  // なので、$(document).on 〜の形式でDOMを再読み込みする必要がある
  // "削除"を押したらイベント発火
  $(document).on('click', '.deletefile', function() {

  // クリックされた削除ボタンのdivのclass名をpropで取得
  // 各divのclass名はimg_indexを利用して一意になっているため、選択したプレビュー画像のみを削除できる
    boxClass = $(this).parent().prop('class');

  // 取得したclass名から、プレビュー画像と、その画像データの含まれたinputを同時に削除
  // この時点でimg_countが10なら、削除した事でプレビュー画像が9個になるたためアップロード画面を再表示して、img_countを-1
  
    $(`.${boxClass}`).remove();
    if (img_count == 10) {
      $('.file-label').attr('style', 'display: flex;')
    }
    img_count -= 1
  });

  // ↓ ここから、削除ボタンを押したらDBのレコードが消えるようにAjaxを実装？


});