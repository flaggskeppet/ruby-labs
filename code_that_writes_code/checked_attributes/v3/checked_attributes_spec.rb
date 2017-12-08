require_relative 'checked_attributes'
require 'rspec'

describe 'checked_attributes' do
  it 'should create a property' do
    class Person; end
    add_checked_attribute(Person, :age) {|v| v >= 18}

    bob = Person.new
    bob.age = 20
  end

  it 'should validate the value using a block' do
    class Person; end
    add_checked_attribute(Person, :age) {|v| v >= 18}

    bob = Person.new
    expect {bob.age = 12}.to raise_error 'Invalid attribute'
  end
end