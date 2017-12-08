module Polite
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def greet
      puts 'Hello Sir!'
    end
  end
end

class Dude
  include Polite
end

Dude.greet