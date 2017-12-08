# Add the the getter/setter using a 'Class Extension Mixin' on all inclusors.
# IE "When this module is included add the following class methods to the including class"
module CheckedAttributes
  def self.included(base)
    base.extend ClassMethods
  end
end

module ClassMethods
  def attr_checked(attribute, &validation)
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method(attribute) do
      instance_variable_get "@#{attribute}"
    end
  end
end