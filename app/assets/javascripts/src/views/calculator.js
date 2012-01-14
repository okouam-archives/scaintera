App.Views.Calculator = Backbone.View.extend({

  TEMPLATE:
    "<tr> \
      <td> \
        <a class='remove' style='display: block; height: 25px; width: 24px; background: url(https://ssl.gstatic.com/ui/v1/icons/mail/sprite_black2.png) no-repeat -61px -41px transparent' href='#'></a> \
      </td> \
      <td> \
        <select class='policy_type' style='width: 350px'> \
          <option value='0'>Groupe - Garantie Limitee</option> \
          <option value='1'>Groupe - Garantie Complete</option> \
          <option value='2'>Groupe Sagesse - Garantie Limitee</option> \
          <option value='3'>Groupe Sagesse - Garantie Complete</option> \
        </select> \
      </td> \
      <td> \
        <select class='beneficiary_count' style='width: 50px'>\
          <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option> \
        </select> \
      </td> \
      <td class='deposit'> \
      </td> \
      <td class='premium'> \
      </td> \
    </tr>",

  pricing: [
    {deposit: 24, premium: 33},
    {deposit: 12, premium: 12},
    {deposit: 75, premium: 43},
    {deposit: 43, premium: 12}
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
    var pricing = this.findPricing(row);
    var numBeneficiaries = this.findBeneficiaries(row);
    this.displayPremium(row, pricing.premium, numBeneficiaries);
    this.displayDeposit(row, pricing.deposit, numBeneficiaries);
    this.recalculate();
  },

  changePolicyType: function(evt) {
    var row = this.findRow(evt);
    var pricing = this.findPricing(row);
    var numBeneficiaries = this.findBeneficiaries(row);
    this.displayPremium(row, pricing.premium, numBeneficiaries);
    this.displayDeposit(row, pricing.deposit, numBeneficiaries);
    this.recalculate();
  },

  displayPremium: function(row, premium, numBeneficiaries) {
    var cell = row.find(".premium");
    cell.text(accounting.formatMoney(premium * numBeneficiaries, { symbol: "GBP",  format: "%v %s" }));
  },

  findBeneficiaries: function(row) {
    return row.find(".beneficiary_count").val();
  },

  add: function() {
    var row = $("table > tbody").append(_.template(this.TEMPLATE)).find("tr:last");
    $('.block table tr:odd').css('background-color', '#fbfbfb');
    var pricing = this.pricing[0];
    var numBeneficiaries = this.findBeneficiaries(row);
    this.displayPremium(row, pricing.premium, numBeneficiaries);
    this.displayDeposit(row, pricing.deposit, numBeneficiaries);
    this.recalculate();
  },

  displayDeposit: function(row, deposit, numBeneficiaries) {
    var cell = row.find(".deposit");
    cell.text(accounting.formatMoney(deposit * numBeneficiaries, { symbol: "GBP",  format: "%v %s" }));
  },

  findRow: function(evt) {
    return $(evt.currentTarget).parents("tr");
  },

  findPricing: function(row) {
    id = row.find("select.policy_type").val();
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
    $deposits = _.map($("tbody td.deposit"), function(v) { return accounting.unformat($(v).text());});
    $premiums = _.map($("tbody td.premium"), function(v) { return accounting.unformat($(v).text());});
    var total_deposits = _.reduce($deposits, function(memo, val) {return memo + val;}, 0);
    var total_premiums = _.reduce($premiums, function(memo, val) {return memo + val;}, 0);
    $("tfoot td.deposit").text(accounting.formatMoney(total_deposits, { symbol: "GBP",  format: "%v %s" }));
    $("tfoot td.premium").text(accounting.formatMoney(total_premiums, { symbol: "GBP",  format: "%v %s" }));
  }
});