module Users
  class AccountInformationForm
    include ActiveModel::Model

    attr_accessor(
      :user,
      :user_name,
      :user_email
    )

    validates :user_name,  presence: true
    validates :user_email, presence: true

    def initialize(attr={})
      super
      @user_name  ||= user.name
      @user_email ||= user.email
    end

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
        name: @user_name,
        email: @user_email
      )
    end
  end
end
