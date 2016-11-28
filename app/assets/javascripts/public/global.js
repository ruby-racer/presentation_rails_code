(function($) {
    $(function() {
        $(document).foundation();
        mainNav();
        scrollTop();
        scrollBottom();
        initFlashNotice();
        initLightBox()
    });
    function mainNav() {
        var $navLink = $('.js-navTrigger'),
            $navContainer = $('.js-nav');
        $navLink.click(function(e) {
            e.preventDefault();
            $navContainer.toggleClass('is-open');
            $(this).toggleClass('is-open');
        });
    }
    function scrollTop() {
        var $scrollTop = $('.js-scrollTop')
        $scrollTop.click(function (e) {
            e.preventDefault();
            $('html, body').animate({
                'scrollTop': 0
            }, 500);
        });
    }
    function scrollBottom() {
        var $scrollBottom = $('.js-scrollBottom');
        $scrollBottom.click(function (e) {
            e.preventDefault();
            var $nextSection = $scrollBottom.closest('section').next();
            if($nextSection.length) {
                $('html, body').animate({
                    'scrollTop': $nextSection.offset().top
                }, 800);
            }
        });
    }

})(jQuery);

//ALERTS AND NOTICES
function initFlashNotice(){
    var alert = $('.j-flash-notice');
    if (alert.length > 0) {
        alert.show().animate({height: 48}, 250);

    window.setTimeout(function() {
        alert.slideUp();
        }, 3200);
    }
}

//LIGHTBOX
function initLightBox() {
    if($('.js-popup-link').length > 0){
        $('.js-popup-link').magnificPopup({
            type: 'image',
            closeBtnInside: false,
            closeOnContentClick: true
        });
        $('body').on('click','.js-popup-close', function(e){
            e.preventDefault();
            $.magnificPopup.close();
        });
    }
}
