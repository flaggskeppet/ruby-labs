#
# Self yield: Pass self to the current block.
#

class Person
  attr_accessor :first_name, :last_name

  def initialize
    yield self
  end
end

joe = Person.new do |p|
  p.first_name = 'John'
  p.last_name = 'Doe'
end

p joe