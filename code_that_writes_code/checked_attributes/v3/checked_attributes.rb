# Compared to prev version: Validation block parameter and invocation
# Validation block takes one arg - that´s the value of the attribute

def add_checked_attribute(clazz, attribute, &validation)
  clazz.class_eval do
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end