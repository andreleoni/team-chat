class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    passwd = params[:user][:password]
    passwd_confirm = params[:user][:password_confirmation]

    if passwd.blank? && passwd_confirm.blank?
      params.require(:user).permit(:first_name, :last_name, :email, :avatar)
    else
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar)
    end    
  end
end
