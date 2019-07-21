time = $('.time').val();

anime({
  targets: '.rate',
  width: [0, time],
  easing: 'easeOutExpo',
});