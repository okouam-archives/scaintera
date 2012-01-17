App.Helpers.RowEditor = Backbone.View.extend({

  events: {
    "change input": "highlight",
    "click .remove": "remove",
    "click .add": "add",
    "click .save": "accept"
  },

  remove: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    this.deleteItem(id, function() {
      $row.fadeOut('slow', function() {
        $(".tipsy").remove();
        $row.remove();
        $('.block table tr').css('background-color', 'white');
        $('.block table tr:odd').css('background-color', '#fbfbfb');
      })
    }.bind(this))
  },

  build: function($row) {
    var $inputs = $row.find('input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    return values;
  },

  add: function() {
    $row = $(this.el).find("table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    $row.find('.save').tipsy({gravity: 'w'});
    $row.find('.remove').tipsy({gravity: 'e'});
    $row.find('.date_picker').datepicker();
    $('.block table tr').css('background-color', 'white');
    $('.block table tr:odd').css('background-color', '#fbfbfb');
    return false;
  },

  highlight: function(evt) {
    $(evt.currentTarget).parents("td").addClass("field_with_changes");
  },

  removeHighlights: function($row) {
    $row.find("td").removeClass("field_with_changes");
    return false;
  },

  getRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  }

});