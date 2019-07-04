module Users
  class ChangePasswordForm
    include ActiveModel::Model

    attr_accessor(
      :user,
      :user_old_password,
      :user_password,
      :user_password_confirmation
    )

    validates :user_old_password, presence: true
    validates :user_password, presence: true
    validates :user_password_confirmation, presence: true
    validates :user_password, confirmation: true

    validate  :check_old_password

    def update
      return false if invalid?
      update_user
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'User')
    end

    private

    def update_user
      @user.update(
        password: @user_password,
        password_confirmation: @user_password_confirmation
      )
    end

    def check_old_password
      if !@user.valid_password?(@user_old_password)
        errors.add(:user_old_password, 'is incorrect')
      end
    end
  end
end
