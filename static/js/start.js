$( document ).ready(function() {
  $(".NomButton").click(function(){
  var formModal = $('.cd-user-modal'),
    formLogin = formModal.find('#cd-login'),
    formSignup = formModal.find('#cd-signup'),
    formForgotPassword = formModal.find('#cd-reset-password'),
    formModalTab = $('.cd-switcher'),
    tabLogin = formModalTab.children('li').eq(0).children('a'),
    tabSignup = formModalTab.children('li').eq(1).children('a'),
    forgotPasswordLink = formLogin.find('.cd-form-bottom-message a'),
    backToLoginLink = formForgotPassword.find('.cd-form-bottom-message a'),
    mainNav = $('.main-nav');

    mainNav.children('ul').removeClass('is-visible');
    formModal.addClass('is-visible');
    formLogin.addClass('is-selected');
    formSignup.removeClass('is-selected');
    formForgotPassword.removeClass('is-selected');
    tabLogin.addClass('selected');
    tabSignup.removeClass('selected');
  });
});