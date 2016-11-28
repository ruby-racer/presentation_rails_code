(function($) {
    $(window).on('load', function() {
        gridResize();
        masonryLayout();
    });
    $(window).on('resize', function() {
        gridResize();
    });
    function masonryLayout() {
        var $container = $('.js-masonry'),
                item = '.js-masonry-item';
        $container.masonry({
            gutter: 0,
            columnWidth: '.js-grid-sizer',
            itemSelector: item
        });
    }
    function gridResize () {
        var $itemMedium = $('.js-item-medium'),
            $itemLarge = $('.js-item-large'),
            itemLargeHeight,
            mediumUp = matchMedia(Foundation.media_queries.medium).matches;
        if($itemMedium.length) {
            if($itemLarge.length && mediumUp) {
                itemLargeHeight = $itemLarge.outerHeight();
                if($itemMedium.length) {
                    $itemMedium.css('height', itemLargeHeight);
                }
            } else {
                $itemMedium.css('height', 'auto');
            }
        }
    }
})(jQuery);
