# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 def create 
   member = Member.find_by(email: session_params[:email])
  if member&.authenticate(session_params[:password])
   session[:member_id] = member_id
   redirect_to root_path, notice: 'ログインしました。'
  else 
   render :new
  end
 end
 def destroy
   reset_session
   redirect_to root_path, notice: 'ログアウトしました。'
 end
 private 
  def session_params
    params.require(:session).permit(:email, :password)
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
