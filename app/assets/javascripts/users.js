/* global $, Stripe */
//Document Ready
$(document).on('turbolinks:load', function(){
    
    var theForm = $('#pro_form');
    var submitBtn= $('#form-submit-btn')
    
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
    
    submitBtn.click(function(event){
        event.preventDefault();
        
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        Stripe.createToken({
            number: ccNum,
            cvc: cvcNum,
            exp_month: expMonth,
            exp_year: expYear
            },stripeResponseHandler);
    })
    
});


//Set Stripe public key
//when user clicks submit button preven default submission

//collect CC fields
//send card info to stripe
//stripe will send us a cc token
//inject card token as hidden field and submit form to our Rails form

