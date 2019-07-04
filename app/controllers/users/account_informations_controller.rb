module Users
  class AccountInformationsController < ApplicationController
    def edit
      @user = Users::AccountInformationForm.new(user: current_user)
    end

    def update
      @user = Users::AccountInformationForm.new(
        user:       current_user, 
        user_name:  user_params[:user_name],
        user_email: user_params[:user_email]
      )

      if @user.update
        redirect_to user_path, notice: 'Account Information Updated'
      end
    end

    private

    def user_params
      params.require(:user).permit(:user_name, :user_email)
    end
  end
end
