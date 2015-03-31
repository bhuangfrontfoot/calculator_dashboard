document.addEventListener('DOMContentLoaded',function(){
  /* Add a basic data series with six labels and values */
  var data = {
    labels: ['10:40 AM', '10:50 AM', '11:00 AM', '11:10 AM', '11:20 AM', '10:30 AM',
      '10:40 AM', '10:50 AM', '11: 00 AM', '11:10 AM', '11:20 AM'],
    series: [
      {
        name: 'Dividend',
        data: [10.3, 8.6, 9.6, 7.4, 8.2, 8.4, 7, 6.5, 7.2, 8.5, 8.9]
      }
    ]
  };

  /* Set some base options (settings will override the default settings in Chartist.js *see default settings*). We are adding a basic label interpolation function for the xAxis labels. */
  var options = {
    axisX: {
      labelInterpolationFnc: function(value) {
        return value;
      }
    },
    axisY: {
      labelInterpolationFnc: function(value) {
        return '$' + value;
      }
    }
  };

  /* Now we can specify multiple responsive settings that will override the base settings based on order and if the media queries match. In this example we are changing the visibility of dots and lines as well as use different label interpolations for space reasons. */

  /* Initialize the chart with the above settings */
  new Chartist.Line('#my-chart', data, options);

  var $chart = $('#my-chart');

  var $toolTip = $chart
    .append('<div class="tooltip"></div>')
    .find('.tooltip')
    .hide();

  $chart.on('mouseenter', '.ct-point', function() {
    var $point = $(this),
      value = $point.attr('ct:value'),
      seriesName = $point.parent().attr('ct:series-name');
    $toolTip.html(seriesName + '<br>' + '$' + value).show();
  });

  $chart.on('mouseleave', '.ct-point', function() {
    $toolTip.hide();
  });

  $chart.on('mousemove', function(event) {
    $toolTip.css({
      left: (event.offsetX || event.originalEvent.layerX) - $toolTip.width() / 2 - 10,
      top: (event.offsetY || event.originalEvent.layerY) - $toolTip.height() - 40
    });
  });
});

