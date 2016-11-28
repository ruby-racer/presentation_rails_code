(function($) {
    $(function() {
        placeholder();
    });
    function placeholder() {
        if(!Modernizr.input.placeholder){
            $('[placeholder]').focus(function() {
                var $this = $(this);
                if ($this.val() == $this.attr('placeholder')) {
                    $this.val('');
                    if($(this).data('type')=='password')
                        $(this).get(0).type='password';
                }
            }).blur(function() {
                var $this = $(this);
                if ($this.val() == '' || $this.val() == $this.attr('placeholder')) {
                    if($(this).attr('type')=='password'){
                        $(this).data('type','password').get(0).type='text';
                    }
                    $this.val($this.attr('placeholder'));
                }
            }).blur();
            $('[placeholder]').parents('form').submit(function() {
                $(this).find('[placeholder]').each(function() {
                    var $this = $(this);
                    if ($this.val() == $this.attr('placeholder')) {
                        $this.val('');
                    }
                })
            });
        }
    }
})(jQuery);
