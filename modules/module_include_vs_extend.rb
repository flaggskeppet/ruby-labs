module Greetings
  def greet
    puts 'hello'
  end

  def method_missing(name, *args, &block)
    puts "method_missing called for #{name}"
  end
end

class ThisClass;  include Greetings; end

ThisClass.new.talk_dirty

