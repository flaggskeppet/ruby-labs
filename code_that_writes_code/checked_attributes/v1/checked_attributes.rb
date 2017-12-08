# Create Mimic methods using Lines of code that are evaluated.
# Cons:
#   Everything gets evaluated at once
#   Hard to write
#   Hard to test small parts
#   Hard to find errors
#   No support by IDE

def add_checked_attribute(clazz, attribute)
  eval <<END
   class #{clazz}

      def #{attribute}=(value)
        raise 'Invalid attribute' unless value
        @#{attribute}=value
      end

      def #{attribute}
         #{attribute}
      end
    end
END
end