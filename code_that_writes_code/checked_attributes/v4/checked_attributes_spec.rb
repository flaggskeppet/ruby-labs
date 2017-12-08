require_relative 'checked_attributes'
require 'rspec'

describe 'checked_attributes' do
  before do
    class Person
      include CheckedAttributes

      attr_checked :age do |v|
        v >= 18
      end
    end
  end

  it 'should create a property' do
    bob = Person.new
    bob.age = 20
  end

  it 'should validate the value using a block' do
    bob = Person.new
    expect {bob.age = 12}.to raise_error 'Invalid attribute'
  end
end