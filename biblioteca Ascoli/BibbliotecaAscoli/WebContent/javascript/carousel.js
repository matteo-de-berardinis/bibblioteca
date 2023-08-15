$(document).ready(function () {



  $("#slider-artisti").owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    mouseDrag: true,
    touchDrag: true,
    autoplay: true,
    autoplayTimeout: 3500,
    autoplaySpeed: 1500,
    smartSpeed: 500,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 6
      }
    }
  })

  $("#slider-band").owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    mouseDrag: true,
    touchDrag: true,
    autoplay: true,
    autoplayTimeout: 3500,
    autoplaySpeed: 1500,
    smartSpeed: 500,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 6
      }
    }
  })



  $("#slider-locali").owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    mouseDrag: true,
    touchDrag: true,
    autoplay: true,
    autoplayTimeout: 3500,
    autoplaySpeed: 1500,
    smartSpeed: 500,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 2
      },
      1000: {
        items: 4
      }
    }
  })


});