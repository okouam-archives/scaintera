App.Views.Calculator = Backbone.View.extend({

  TEMPLATE:
    "<tr> \
      <td> \
        <a class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      </td> \
      <td> \
        <select class='policy_type' style='width: 350px'> \
          <option value='0'>ACTIVE</option> \
          <option value='1'>MI-ACTIVE</option> \
          <option value='2'>SAGESSE</option> \
          <option value='3'>MI-SAGESSE</option> \
        </select> \
      </td> \
      <td> \
        <select class='beneficiary_count' style='width: 50px'>\
          <option>1</option><option>2</option><option>3</option><option>4</option> \
        </select> \
      </td> \
      <td class='joining_fee'> \
      </td> \
      <td class='premium'> \
      </td> \
    </tr>",

  pricing: [
    [{joining_fee: 123.75, premium: 31}, {joining_fee: 178.75, premium: 45}, {joining_fee: 233.75, premium: 59}, {joining_fee: 288.75, premium: 73}],
    [{joining_fee: 96, premium: 25}, {joining_fee: 151.25, premium: 38}, {joining_fee: 206.25, premium: 52}, {joining_fee: 261.25, premium: 66}],
    [{joining_fee: 146.26, premium: 37}, {joining_fee: 187.50, premium: 47}, {joining_fee: 237.50, premium: 60}, {joining_fee: 316.25, premium: 80}],
    [{joining_fee: 123.75, premium: 31}, {joining_fee: 178.75, premium: 45}, {joining_fee: 233.75, premium: 59}, {joining_fee: 288.75, premium: 73}]
  ],

  events: {
    "click .blue-button.add": "add",
    "click .blue-button.reset": "reset",
    "click .remove": "remove",
    "change .policy_type": "changePolicyType",
    "change .beneficiary_count": "changeBeneficiaryCount"
  },

  changeBeneficiaryCount: function(evt) {
    var row = this.findRow(evt);
    var numBeneficiaries = this.findBeneficiaries(row);
    var pricing = this.findPricing(row, numBeneficiaries);
    this.displayPremium(row, pricing.premium, numBeneficiaries);
    this.displayJoiningFee(row, pricing.joining_fee, numBeneficiaries);
    this.recalculate();
  },

  changePolicyType: function(evt) {
    var row = this.findRow(evt);
    var numBeneficiaries = this.findBeneficiaries(row);
    var pricing = this.findPricing(row, numBeneficiaries);
    this.displayPremium(row, pricing.premium);
    this.displayJoiningFee(row, pricing.joining_fee);
    this.recalculate();
  },

  displayPremium: function(row, premium) {
    var cell = row.find(".premium");
    cell.text(accounting.formatMoney(premium, { symbol: "GBP",  format: "%v %s" }));
  },

  findBeneficiaries: function(row) {
    return row.find(".beneficiary_count").val();
  },

  add: function() {
    var row = $("table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    $('.block table tr:odd').css('background-color', '#fbfbfb');
    var pricing = this.pricing[0][0];
    this.displayPremium(row, pricing.premium);
    this.displayJoiningFee(row, pricing.joining_fee);
    this.recalculate();
  },

  displayJoiningFee: function(row, joining_fee) {
    var cell = row.find(".joining_fee");
    cell.text(accounting.formatMoney(joining_fee, { symbol: "GBP",  format: "%v %s" }));
  },

  findRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  },

  findPricing: function(row, num_beneficiaries) {
    var id = row.find("select.policy_type").val();
    return this.pricing[id][num_beneficiaries - 1];
  },

  remove: function(evt) {
    var row = this.findRow(evt);
    row.remove();
    this.recalculate();
  },

  reset: function() {
    $("tbody tr").remove();
    this.recalculate();
  },

  recalculate: function() {
    $joining_fees = _.map($("tbody td.joining_fee"), function(v) { return accounting.unformat($(v).text());});
    $premiums = _.map($("tbody td.premium"), function(v) { return accounting.unformat($(v).text());});
    var total_joining_fees = _.reduce($joining_fees, function(memo, val) {return memo + val;}, 0);
    var total_premiums = _.reduce($premiums, function(memo, val) {return memo + val;}, 0);
    $("tfoot td.joining_fee").text(accounting.formatMoney(total_joining_fees, { symbol: "GBP",  format: "%v %s" }));
    $("tfoot td.premium").text(accounting.formatMoney(total_premiums, { symbol: "GBP",  format: "%v %s" }));
  }
});