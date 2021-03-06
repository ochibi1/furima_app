document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { 
      Payjp.setPublicKey("pk_test_af548a3c63ea70a1f6f33401"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value,
          cvc: document.getElementById("cvc").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
              );
            document.forms["card_token"].submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  },
  false
);