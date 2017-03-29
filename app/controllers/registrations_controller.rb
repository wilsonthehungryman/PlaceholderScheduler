#
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :user_name, :email, :password,
                                 :password_confirmation, :permission, :active)
  end

  def account_update_params
    params.require(:user).permit(:name, :user_name, :email, :password,
                                 :password_confirmation, :permission, :active)
  end
end
