module Users
  class ChangePasswordsController < ApplicationController
    def edit
      @user = Users::ChangePasswordForm.new(object: current_user)
    end

    def update
      hash_params = user_params.merge(object: current_user)
      @user = Users::ChangePasswordForm.new(hash_params)

      if @user.persist
        redirect_to user_path, notice: 'Password Changed'
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :password, 
        :password_confirmation, 
        :old_password)
    end
  end
end
