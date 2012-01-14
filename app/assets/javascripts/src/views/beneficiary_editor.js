App.Views.BeneficiaryEditor = App.Helpers.RowEditor.extend({

  events: {
    "change input": "highlight",
    "click .remove": "remove",
    "click .add": "add",
    "click .save": "accept"
  },

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
      <td></td> \
      <td></td> \
      <td style='padding: 2px; width: 30px'> \
        <a class='save' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -2px -19px transparent' href='#'></a> \
      </td>",

  initialize: function(options) {
    this.policy_id = options.policy_id;
    this.url = "/policies/" + this.policy_id + "/beneficiaries/";
  },

  accept: function(evt) {
    var $row = this.getRow(evt);
    var id = $row.data("id");
    var data = this.build($row);
    if (id) {
      data.id = id;
      $.ajax({
        url: this.url + id,
        type: "PUT",
        data: {beneficiary: data},
        success: function() {
          this.removeHighlights($row);
          return false;
        }.bind(this)
      });
    } else {
      $.ajax({
        url: this.url,
        type: "POST",
        data: {beneficiary: data},
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
    else if (confirm("Are you sure you want to delete this beneficiary?")) {
      $.ajax({
        type: "DELETE",
        url: this.url + id,
        success: callback
      });
    };
  }

});