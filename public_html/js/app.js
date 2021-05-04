(function ($) {
  var jobActiveShow;

  function selectFirstVisibleJob() {
    var $option = $(
      ".field-contactform-jobTitle .nice-select li.option:visible"
    ).first();
    var $dropdown = $option.closest(".nice-select");

    $dropdown.find(".selected").removeClass("selected");
    $option.addClass("selected");

    var text = $option.data("display") || $option.text();
    $dropdown.find(".current").text(text);

    $dropdown.prev("select").val($option.data("value")).trigger("change");
  }

  function setJobDetails(jobRow) {
    if (jobRow) {
      $(jobActiveShow).find('.job-text.last-update').text($(jobRow).data('last-update') || '');
      $(jobActiveShow).find('.job-text.job-code').text($(jobRow).find('td.jobcode').text());
      $(jobActiveShow).find('.job-text.location').text($(jobRow).find('td.cityname').text());
      $(jobActiveShow).find('.job-text.description').html($(jobRow).data('description') || '');
      $(jobActiveShow).find('.job-text.requirements').html($(jobRow).data('requirements') || '');
    }else{
      $(jobActiveShow).find('.job-text.last-update').text('');
      $(jobActiveShow).find('.job-text.job-code').text('');
      $(jobActiveShow).find('.job-text.location').text('');
      $(jobActiveShow).find('.job-text.description').text('');
      $(jobActiveShow).find('.job-text.requirements').text('');
    } 
   }

  function jobActiveShowHandler(el) {
    var row = $(el.target).parents("tr");
    if (row.length < 1) return;

    if ($(jobActiveShow).prev("tr")[0] !== row[0]) {
      // 1. Update details of current job
      setJobDetails(row);

      // 2. Add style class
      $(row).addClass('active-tr').siblings('tr').removeClass('active-tr');

      // 3. Show the details section below the row
      $(jobActiveShow).hide().insertAfter(row).fadeIn(600);
    }
  }

  /**** EVENT HANDLERS *****/
  $(document).on("click", "button[type='submit']", function () {
    setTimeout(function () {
      $(".has-error:first > input:first").focus();
    }, 500);
  });

  $(document).on("change", "#contactform-store", function () {
    $(".field-contactform-jobTitle li[store!='" + this.value + "']").hide();
    $(".field-contactform-jobTitle li[store='" + this.value + "']").show();
    selectFirstVisibleJob();
  });

  $(document).on("nice-contactform-jobTitle-ready", function () {
    $("#contactform-store").trigger("change");
  });

  /**** READY FUNCTION ****/
  $(document).ready(function () {
    jobActiveShow = $("tr#job-active-show");
    $(jobActiveShow).hide();

    // Handler show active job details
    $(".show-job-details").on("click", jobActiveShowHandler.bind(this));

    // Handler to chenge the state of the checkbox
    $(document).on("change", '.checkbox > input[type="checkbox"]', function () {
      if ($(this).prop("checked")) {
        $(this).parents("tr").addClass("checked-job");
      } else {
        $(this).parents("tr").removeClass("checked-job");
      }
    });
  });
})(jQuery);
