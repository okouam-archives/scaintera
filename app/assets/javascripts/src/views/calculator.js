App.Views.Calculator = Backbone.View.extend({

  TEMPLATE:
    "<tr> \
      <td> \
        <a class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      </td> \
      <td> \
        <select class='policy_type' style='width: 350px'> \
          <option value='young_active'>Personne de 0 a 55, active</option> \
          <option value='young_semi_active'>Personne de 0 a 55, mi-active</option> \
          <option value='senior_active'>Personne de 56 a 70, active</option> \
          <option value='senior_semi_active'>Personne de 56 a 70, mi-active</option> \
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
    {joining_fee: 200, premium: 77},
    {joining_fee: 200, premium: 67},
    {joining_fee: 225, premium: 95},
    {joining_fee: 225, premium: 85}
  ],

  events: {
    "click .blue-button.add": "add",
    "click .blue-button.reset": "reset",
    "click .remove": "remove",
    "change .policy_type": "changePolicyType",
    "change .beneficiary_count": "changeBeneficiaryCount"
  },

  initialize: function(options) {
    this.pricing = options.pricing;
  },

  changeBeneficiaryCount: function(evt) {
    var row = this.findRow(evt);
    var numBeneficiaries = this.findBeneficiaries(row);
    var pricing = this.findPricing(row, numBeneficiaries);
    this.displayPremium(row, pricing.premium * numBeneficiaries);
    this.displayJoiningFee(row, pricing.joining_fee * numBeneficiaries);
    this.recalculate();
  },

  changePolicyType: function(evt) {
    var row = this.findRow(evt);
    var numBeneficiaries = this.findBeneficiaries(row);
    var pricing = this.findPricing(row);
    this.displayPremium(row, pricing.premium * numBeneficiaries);
    this.displayJoiningFee(row, pricing.joining_fee * numBeneficiaries);
    this.recalculate();
  },

  displayPremium: function(row, premium) {
    var cell = row.find(".premium");
    var amount = accounting.formatMoney(premium, { symbol: "GBP",  format: "%v %s" });
    cell.text(amount);
  },

  findBeneficiaries: function(row) {
    return row.find(".beneficiary_count").val();
  },

  add: function() {
    var row = $("table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    $('.block table tr:odd').css('background-color', '#fbfbfb');
    var pricing = this.pricing["young_active"];
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

  findPricing: function(row) {
    var id = row.find("select.policy_type").val();
    return this.pricing[id];
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