class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

   def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:notice] = "Post dodany!"
      redirect_to current_user
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end
