App.Views.InsuranceProductEditor = Backbone.View.extend({

  events: {
    "click .remove": "remove",
    "click .add": "add",
    "click .edit": "edit",
    "click .accept": "accept",
    "click .cancel": "cancel"
  },

  remove: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    this.deleteInsuranceProduct(id, function() {
      $row.remove();
    }.bind(this))
  },

  add: function() {

  },

  edit: function(evt) {
    var $row = this.getRow(evt);
    this.makeEditable($row);
  },

  accept: function(evt) {
    var $row = this.getRow(evt);
    var beneficiary = this.buildBeneficiary($row);
    this.saveInsuranceProduct(beneficiary, function() {
      this.makeViewable($row);
    }.bind(this))
  },

  cancel: function() {
    var $row = this.getRow(evt);
    this.makeViewable($row);
  },

  makeEditable: function(row) {

  },

  makeViewable: function(row) {

  },

  deleteInsuranceProduct: function(id, callback) {
   if (confirm("Are you sure you want to delete this insurance product?")) {
      $.ajax({
        type: "DELETE",
        url: "/insurance_products/" + id,
        success: callback
      });
    };
  },

  getRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  }

});