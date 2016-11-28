(function($) {
    $(function() {
        new WOW().init();
        initSliders();
    });

})(jQuery);

$(window).scroll(function () {
//   initParallaxHeader();
});

function initParallaxHeader(){
    var currTop = $(window).scrollTop(),
        $header = $(".j-introSection-imageWrap"),
        newY = (currTop / -1.3) + 'px';

    if (Modernizr.touch || currTop > $header.outerHeight()) {
        return;
    }
    $header.css("backgroundPosition-y", newY);
}

function initSliders(){
    $('.js-slider').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: false,
        fade: true
    });
    $('.js-testimonialSection-slider').slick({
        autoplay: true,
        autoplaySpeed: 3000,
        arrows: false,
        fade: true
    });
}
