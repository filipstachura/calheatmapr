HTMLWidgets.widget({

  name: 'callheatmapr',

  type: 'output',

  factory: function(el, width, height) {


    return {

      renderValue: function(options) {
        options.start = new Date(parseInt(options.timestamp_start));
        var cal = new CalHeatMap();
        options.itemSelector = "#" + el.id;
        document.getElementById(el.id).innerHTML = "";
      	cal.init(options);
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }

    };
  }
});
