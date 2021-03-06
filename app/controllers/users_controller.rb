class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def  create

    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end


  def current_user_info
    render json: { info: current_user, reports: current_user.reports }
  end


  def user_params
     params.require(:user).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation,
                                                :avatar,
                                                :provider,
                                                :uid,
                                                :oauth_token,
                                                :oauth_secret,
                                                :oauth_raw_data
                                                ])

    end
end
