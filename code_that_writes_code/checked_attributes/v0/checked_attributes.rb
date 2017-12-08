# This is the concept: We want to add validated getters/setters for a given class
class Person
  def age=(value)
    raise 'Invalid attribute' unless value
    @age=value
  end

  def age
    @age
  end
end