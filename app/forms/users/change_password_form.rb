module Users
  class ChangePasswordForm < FormObject
    attr_accessor(
      :object,
      :old_password,
      :password,
      :password_confirmation
    )

    validates :old_password, presence: true
    validates :password,     presence: true
    validates :password,     confirmation: true

    validate :check_old_password

    def self.model_name
      ActiveModel::Name.new(self, nil, 'User')
    end

    private

    def klass
      User
    end

    def set_attributes; end;

    def object_params
      {
        password: @password,
        password_confirmation: @password
      }
    end

    def check_old_password
      if not user_object.valid_password?(@old_password)
        errors.add(:old_password, 'is incorrect')
      end
    end

    def user_object
      User.find(@object.id)
    end
  end
end
