App.Views.Search = Backbone.View.extend({

  events: {
    "click .aoq-wrapper": "show",
    "click a.close-button": "hide"
  },
  show: function() {
    $("#advanced").show();
    $(".aoq-wrapper").css("visibility", "hidden");
  },

  hide: function() {
    $("#advanced").hide();
    $(".aoq-wrapper").css("visibility", "visible");
  }

});