class FormObject
  include ActiveModel::Model

  validate :validate_data_integrity

  def initialize(attrs={})
    super
    set_attributes if self.object.present?
    set_object
  end

  def persist
    return false if invalid?
    persist!
  end
  
  def destroy
    destroy!
  end

  protected

  def set_object
    if self.object.present?
      @object = klass.find(self.object.id)
      @object.assign_attributes(object_params)
    else
      @object = klass.new(object_params)
    end
  end

  def persist!
    @object.save
  end

  def destroy!
    @object.destroy
  end

  def validate_data_integrity
    if @object.invalid?
      promote_errors(@object.errors)
    end
  end

  def promote_errors(model_errors)
    model_errors.each do |attribute, message|
      @errors.add(attribute, message)
    end 
  end
end
