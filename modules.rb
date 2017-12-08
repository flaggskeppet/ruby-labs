module M
   #extend self
   def greet
    puts "hello"
   end
end

include M
greet

class MinKlass
  #include M
  def do_it
    greet
  end
end

klassen = MinKlass.new
klassen.do_it