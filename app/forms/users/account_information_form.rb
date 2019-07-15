module Users
  class AccountInformationForm < FormObject
    attr_accessor(
      :object,
      :name,
      :email
    )

    validates :name,  presence: true
    validates :email, presence: true

    def self.model_name
      ActiveModel::Name.new(self, nil, 'User')
    end

    private

    def klass
      User
    end

    def set_attributes
      @name  ||= self.object.name
      @email ||= self.object.email
    end

    def object_params
      {
        name:  @name,
        email: @email 
      }
    end
  end
end
