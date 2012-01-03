class BeneficiariesController < ApplicationController

  def index
    @beneficiaries = Beneficiary.all
  end

end