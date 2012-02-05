class SessionsController < ApplicationController
  def new
    @title = I18n.t(:t_signin)
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = I18n.t(:t_signin_error)
      @title = I18n.t(:t_signin)
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
  	 sign_out
    redirect_to root_path
  end

end
