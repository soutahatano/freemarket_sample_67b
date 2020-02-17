$(function(){
  Payjp.setPublicKey('pk_test_e1c9d1fcc32a67be05740c5e');
  $(document).on("click", ".payment-page__content__register-btn", function(e) {
    e.preventDefault();
    $(".payment-page__content__register-btn").prop("disabled", true);
    var card = {
        number: parseInt($("#payment_card_no").val()),
        cvc: parseInt($("#payment_card_security_code").val()),
        exp_month: parseInt($("#payment_card_expire_mm").val()),
        exp_year: parseInt($("#payment_card_expire_yy").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        $(".payment-page__content__register-btn").prop('disabled', false);
      }
      else {
        $("#payment_card_no").removeAttr("name");
        $("#payment_card_security_code").removeAttr("name");
        $("#payment_card_expire_mm").removeAttr("name");
        $("#payment_card_expire_yy").removeAttr("name");

        var token = response.id;
        $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
      }
    });
  });
});