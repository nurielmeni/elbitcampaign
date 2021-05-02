(function($) {
    
    function selectFirstVisibleJob(){
        var $option = $(".field-contactform-jobTitle .nice-select li.option:visible").first();
        var $dropdown = $option.closest('.nice-select');

        $dropdown.find('.selected').removeClass('selected');
        $option.addClass('selected');

        var text = $option.data('display') || $option.text();
        $dropdown.find('.current').text(text);

        $dropdown.prev('select').val($option.data('value')).trigger('change');
    }
    
    /**** EVENT HANDLERS *****/
    $(document).on("click", "button[type=\'submit\']", function() { 
        setTimeout(function () {$(".has-error:first > input:first").focus(); }, 500); 
    });
    
    $(document).on("change", "#contactform-store", function() { 
        $(".field-contactform-jobTitle li[store!=\'" + this.value + "\']").hide(); 
        $(".field-contactform-jobTitle li[store=\'" + this.value + "\']").show();
        selectFirstVisibleJob();
    });
    
    $(document).on('nice-contactform-jobTitle-ready', function() {
        $('#contactform-store').trigger('change');        
    });
    
    /**** READY FUNCTION ****/
    $(document).ready(function() {
        // Trigger change on the store to filter the jobs
        
    });
})(jQuery);