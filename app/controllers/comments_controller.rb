class CommentsController < ApplicationController

  def show
    @policy_holder = PolicyHolder.find(params[:id])
  end

  def create
    policy = Policy.find(params[:policy_id])
    if policy.comments.create({user: current_user, comment: params[:comment][:comment]})

    else

    end
    redirect_to "/policies/#{policy.id}/comments"
  end

end