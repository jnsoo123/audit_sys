module Users
  class ChangePasswordsController < ApplicationController
    def edit
      @user = Users::ChangePasswordForm.new(user: current_user)
    end

    def update
      @user = Users::ChangePasswordForm.new(
        user: current_user,
        user_old_password: user_params[:user_old_password],
        user_password: user_params[:user_password],
        user_password_confirmation: user_params[:user_password_confirmation]
      )

      if @user.update
        redirect_to user_path, notice: 'Password Changed'
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :user_password, 
        :user_password_confirmation, 
        :user_old_password)
    end
  end
end
