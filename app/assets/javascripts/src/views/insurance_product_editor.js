App.Views.InsuranceProductEditor = App.Helpers.RowEditor.extend({

  TEMPLATE: " \
    <tr> \
      <td style='padding: 2px; width: 40px'> \
        <a class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      <td> \
        <input name='expiry_date' class='cover' type='text' style='border: 1px solid #efefef' /> \
      <td> \
        <input name='expiry_date' class='premium_amount' type='text' style='border: 1px solid #efefef' /> \
      <td> \
        <input name='expiry_date' class='expiry_date' type='text' style='border: 1px solid #efefef' /> \
      </td> \
      <td style='padding: 2px; width: 30px'> \
        <a class='save' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -2px -19px transparent' href='#'></a> \
      </td>",

  initialize: function(options) {
    this.policy_holder_id = options.policy_holder_id;
  },

  accept: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    var data = this.build($row);
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
          $row.data("id", response);
          this.removeHighlights($row);
          return false;
        }.bind(this)
      });
      return false;
    }
  },

  deleteItem: function(id, callback) {
    if (!id) callback();
    else if (confirm("Are you sure you want to delete this insurance product?")) {
      $.ajax({
        type: "DELETE",
        url: "/policy_holders/" + this.policy_holder_id + "/insurance_products/" + id,
        success: callback
      });
    };
  }

});