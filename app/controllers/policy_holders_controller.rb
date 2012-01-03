class PolicyHoldersController < ApplicationController

  def index
    @policy_holders = PolicyHolder.all
  end

end