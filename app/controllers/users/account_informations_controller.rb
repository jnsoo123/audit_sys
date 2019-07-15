module Users
  class AccountInformationsController < ApplicationController
    def edit
      @user = Users::AccountInformationForm.new(object: current_user)
    end

    def update
      hash_params = user_params.merge(object: current_user)
      @user = Users::AccountInformationForm.new(hash_params)

      if @user.persist
        redirect_to user_path, notice: 'Account Information Updated'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
