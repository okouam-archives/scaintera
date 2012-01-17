App.Views.BeneficiaryEditor = App.Helpers.RowEditor.extend({

  TEMPLATE: " \
    <tr> \
      <td style='padding: 2px; width: 40px'> \
        <a title='Remove beneficiary' class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      <td> \
        <input name='names' class='names' type='text' style='border: 1px solid #efefef' /> \
      <td> \
        <input name='surname' class='surname' type='text' style='border: 1px solid #efefef; width: 100px' /> \
      <td> \
        <input name='relationship' class='relationship' type='text' style='border: 1px solid #efefef; width: 100px' /> \
      </td> \
      <td><input name='telephone' class='telephone' type='text' style='border: 1px solid #efefef' /></td> \
      <td><input name='dob' class='dob' type='text' style='border: 1px solid #efefef; width: 100px' /></td> \
      <td style='padding: 2px; width: 30px'> \
        <a class='save' title='Save changes' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -2px -19px transparent' href='#'></a> \
      </td>",

  initialize: function(options) {
    this.policy_id = options.policy_id;
    this.url = "/beneficiaries/";
  },

  accept: function(evt) {
    $(this.el).find(".errors").hide();
    var $row = this.getRow(evt);
    var id = $row.data("id");
    var data = this.build($row);
    if (id) {
      data.id = id;
      $.ajax({
        url: this.url + id,
        type: "PUT",
        data: {beneficiary: data},
        error: function(response) {
          return this.showErrors(eval("(" + response.responseText + ")").errors);
        }.bind(this),
        success: function() {
          return this.removeHighlights($row);
        }.bind(this)
      });
    } else {
      $.ajax({
        url: this.url,
        type: "POST",
        data: {beneficiary: data, policy_id: this.policy_id},
        error: function(response) {
          return this.showErrors(eval("(" + response.responseText + ")").errors);
        }.bind(this),
        success: function(response) {
          $row.data("id", response.id);
          return this.removeHighlights($row);
        }.bind(this)
      });
      return false;
    }
  },

  showErrors: function(errors) {
    $(this.el).find(".errors").html(errors.join(", ")).show();
    return false;
  },

  deleteItem: function(id, callback) {
    $(this.el).find(".errors").hide();
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