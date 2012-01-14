App.Helpers.RowEditor = Backbone.View.extend({

  remove: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    this.deleteItem(id, function() {
      $row.remove();
    }.bind(this))
  },

  build: function($row) {
    var $inputs = $row.find('input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    return $values;
  },

  add: function() {
    $(this.el).find("table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    return false;
  },

  highlight: function(evt) {
    $(evt.currentTarget).parents("td").addClass("field_with_changes");
  },

  removeHighlights: function($row) {
    $row.find("td").removeClass("field_with_changes");
  },

  getRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  }

});