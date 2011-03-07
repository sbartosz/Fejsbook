class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
 # before_filter :authorized_user, :only => :destroy



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
	@micropost = Micropost.find(params[:id])
	@micropost.destroy
	flash[:notice] = "Post usunięty"
	redirect_to current_user	
  end

  private

    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end
