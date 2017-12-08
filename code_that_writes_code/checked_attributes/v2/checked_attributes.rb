# Use class_eval on provided class together with method in order to create method, and set/get the instance variable

def add_checked_attribute(clazz, attribute)
  clazz.class_eval do
    # Create a dynamic method
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless value
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end