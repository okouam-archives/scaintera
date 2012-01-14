App.Views.InsuranceProductEditor = Backbone.View.extend({

  TEMPLATE: " \
    <tr> \
      <td style='padding: 2px; width: 40px'> \
        <a class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      <td> \
        <input class='cover' type='text' style='border: 1px solid #efefef' /> \
      <td> \
        <input class='premium_amount' type='text' style='border: 1px solid #efefef' /> \
      <td> \
        <input class='expiry_date' type='text' style='border: 1px solid #efefef' /> \
      </td> \
      <td style='padding: 2px; width: 30px'> \
        <a class='save' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -2px -19px transparent' href='#'></a> \
      </td>",

  events: {
    "change input": "highlight",
    "click .remove": "remove",
    "click .add": "add",
    "click .save": "accept"

  },

  initialize: function(options) {
    this.policy_holder_id = options.policy_holder_id;
  },

  remove: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    this.deleteInsuranceProduct(id, function() {
      $row.remove();
    }.bind(this))
  },

  highlight: function(evt) {
    $(evt.currentTarget).parents("td").addClass("field_with_changes");
  },

  add: function() {
    $("#other_insurance_products table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    return false;
  },

  accept: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    var data = {
      cover: $row.find(".cover").val(),
      premium_amount: $row.find(".premium_amount").val(),
      expiry_date: $row.find(".expiry_date").val()
    };
    if (id) {
      data.id = id;
      $.ajax({
        url: "/policy_holders/" + this.policy_holder_id + "/insurance_products/" + id,
        type: "PUT",
        data: {
          data: {insurance_product: data}
        },
        success: function() {
          this.removeHighlights($row);
          return false;
        }.bind(this)
      });
    } else {
      $.ajax({
        url: "/policy_holders/" + this.policy_holder_id + "/insurance_products/",
        type: "POST",
        data: {insurance_product: data},
        success: function(response) {
          console.debug(response);
          $row.data("id", response);
          this.removeHighlights($row);
          return false;
        }.bind(this)
      });
      return false;
    }
  },

  removeHighlights: function($row) {
    $row.find("td").removeClass("field_with_changes");
  },

  deleteInsuranceProduct: function(id, callback) {
    if (!id) callback();
    else if (confirm("Are you sure you want to delete this insurance product?")) {
      $.ajax({
        type: "DELETE",
        url: "/policy_holders/" + this.policy_holder_id + "/insurance_products/" + id,
        success: callback
      });
    };
  },

  getRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  }

});