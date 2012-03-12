App.Views.RowEditor = Backbone.View.extend({

  events: {
    "click .remove": "remove",
    "click .add": "add"
  },

  initialize: function() {
    $(this.el).find("input.date_picker").each(function(i, item) {
      this.formatDates($(item));
    }.bind(this));
  },

  formatDates: function($input) {
    if ($input.val()) {
      var new_date = $input.val().match(/\d{4}-\d{2}-\d{2}/);
      $input.val(new_date);
    }
  },

  remove: function(evt) {
    if (confirm(this.delete_message)) {
      var $row = $(evt.currentTarget).parents("tr");
      $row.remove();
      this.updateLayout($row);
    }
    return false;
  },

  updateLayout: function($row) {
    $('.block table tr').css('background-color', 'white');
    $('.block table tr:odd').css('background-color', '#fbfbfb');
    this.formatDates($row);
    $row.find('.date_picker').datepicker();
    this.resetCounters();
  },

  resetCounters: function() {
    $(this.el).find("tbody tr").each(function(i, item) {
      var inputs = $(item).find("input, select");
      inputs.each(function(n, input) {
        var name = $(input).attr("name");
        var new_name = this.fixName(i, name);
        $(input).attr("name", new_name);
      }.bind(this));
    }.bind(this));
  },

  fixName: function(i, name) {
    var exp = /\[\d+\]/g;
    return name.replace(exp, "[" + i + "]");
  },

  add: function() {
    var source = $(this.template).html();
    var template = Handlebars.compile(source);
    $row = $(this.el).find("table > tbody").append(template());
    this.updateLayout($row);
    return false;
  }

});