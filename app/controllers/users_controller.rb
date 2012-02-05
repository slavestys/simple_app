class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user,   :only => :destroy
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  def new
  	@title = I18n.t(:t_signup)
  end
 def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  def index  
    @title = I18n.t(:t_users)
    @users = User.paginate(:page => params[:page])
  end
  def new
  	 @user = User.new
   	 @title = I18n.t(:t_signup_caption)
  end
  def create
    @user = User.new(params[:user])
    if @user.save
     sign_in @user
    	flash[:success] = I18m.t(:t_welcome)
       redirect_to @user
    else
      @title = I18n.t(:t_signup_caption)
      render 'new'
    end
  end 	 
   def edit    
    @title = I18n.t(:t_settings)
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = I18n.t(:t_settings)
      render 'edit'
    end
  end
 def following
    @title = I18n.t(:t_following_head)
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = I18n.t(:t_followed_head)
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  private   
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
