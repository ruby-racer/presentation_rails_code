(function($) {
    $(function() {
        squareGrid();
        touchHover();
    });

    $(window).on('resize', function () {
        squareGrid();
    });

    function squareGrid() {
        var $gridEl = $('.js-squareItem'),
            $gridElLarge = $('.js-squareItem--large'),
            largeUp = matchMedia(Foundation.media_queries.large).matches;
        if(!largeUp) {
            if($gridEl.length) {
                $gridEl.css('height', $gridEl.outerWidth());
            }
            if ($gridElLarge.length) {
                $gridElLarge.css('height', $gridElLarge.outerWidth());
            }
        } else {
            $gridEl.css('height', '100%');
            $gridElLarge.css('height', '100%');
        }
    }

    function touchHover() {
        if (Modernizr.touch) {
            var $sections = $('.js-sections > div');

            //ADD HOVER CLASS ON CLICK
            $sections.on('click', function() {
                $(this).addClass('is-visible').siblings().removeClass('is-visible');
            });

            $(window).scroll(function () {
                //ADD HOVER CLASS WHEN DIV IN FOCUS
                $sections.each(function(){
                    var sectionTop = $(this).offset().top,
                    sectionHeight = $(this).outerHeight(),
                    sectionFocusPoint = (sectionTop - (sectionHeight/6)),
                    sectionBottom = sectionTop + sectionHeight,
                    scrolled = $(window).scrollTop();

                    if(scrolled > sectionFocusPoint && scrolled < sectionBottom && scrolled > 50){
                        $(this).addClass('is-visible');
                    } else {
                        $(this).removeClass('is-visible')
                    }
                });
            });
        }
    }
})(jQuery);
