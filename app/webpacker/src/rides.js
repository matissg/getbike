$(document).on('turbolinks:load', function() {

  if ($('form.ride').is(':visible')) {

    var formId = $('form').attr('id');

    var closestRide = $('#ride_starts_ends').data('closest');
    $('#ride_starts_ends').daterangepicker({
      minDate: closestRide.split(',')[0],
      maxDate: moment().add(365, 'days'),
      timePicker: true,
      timePicker24Hour: true,
      opens: "right",
      drops: "down",
      locale: {
        "format": "DD.MM.YYYY HH:mm",
        "separator": " - ",
        "firstDay": 1
      },
      isInvalidDate: function(date) {
        return (date.day() == 0 || date.day() == 6);
      }
    });

    $('#ride_starts_ends').keydown(function(event) {
      event.preventDefault();
      return false;
    });

    $('#ride_starts_ends').on('apply.daterangepicker', function(ev, picker) {

      var starts_ends = $('#ride_starts_ends').val();

      $.ajax({
        url: "/bikes",
        data: {
          range: starts_ends
        },
        format: "json"
      }).done(function(msg) {
        $("#bike-status").empty();
        $("#bike-status").append(msg.text);
        if (msg.available === false) {
          $("#bike-status").css("background-color", "tomato");
          $("input#submit-ride").prop('disabled', true);
        } else if (msg.available === true) {
          $("#bike-status").css("background-color", "yellowgreen");
          $("input#submit-ride").prop('disabled', false);
        }
      }).fail(function() {
        alert("Ooops, something went wrong!");
      });

    });

    if ($('#ride_starts_ends').is(':visible')) {
      $('#ride_starts_ends').trigger("apply.daterangepicker");
    }

  }

});
