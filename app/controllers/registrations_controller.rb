class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:login, :password, :password_confirmation, :email)
  end
 
  def account_update_params
    params.require(:user).permit(:login, :password, :password_confirmation, :current_password, :email)
  end

end
