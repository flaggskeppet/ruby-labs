require_relative 'checked_attributes'
require 'rspec'

describe 'checked_attributes' do
  it 'should create a property' do
    class Person; end
    add_checked_attribute(Person, :age)

    bob = Person.new
    bob.age = 20
  end

  it 'should not allow nil values' do
    class Person; end
    add_checked_attribute(Person, :age)

    bob = Person.new
    expect {bob.age = nil}.to raise_error 'Invalid attribute'
  end
end