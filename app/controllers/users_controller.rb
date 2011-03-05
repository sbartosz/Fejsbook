class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
	
  def new
	@user = User.new
	@title = "Zapisz sie"	
  end

  def index
    @title = "All users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @micropost = Micropost.new if signed_in?
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
       sign_in @user
       flash[:notice] = "Witamy na facebooku"
       redirect_to user_path(@user)
    else
      @title = "Zarejestruj się"
      render 'new'
    end
  end

  def edit
	@title = "Edytuj dane osobowe"
        @user = User.find(params[:id])
  end
 
   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profil zaaktualizowany."
      redirect_to @user
    else
      @title = "Edycja danych"
      render 'edit'
    end
  end	

 private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end


