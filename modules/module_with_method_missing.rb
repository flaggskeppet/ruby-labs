module Greetings
  def greet
    puts 'hello'
  end
end

module BigModule
  include Greetings
end

class ThisClass;  include Greetings; end

class ThatClass; extend Greetings; end
class ThatOtherClass; extend BigModule; end

obj = ThisClass.new
obj.greet

ThatClass.greet
ThatOtherClass.greet