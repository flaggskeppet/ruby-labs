# Enkel yield
def do_something
  yield if block_given?
end
do_something {puts 'hello from inside the block'}

# Anropa en metod som skickar in ett argument till ett block
# tänk yield('hello world') är som blocket('hello world')
def do_something_with_an_arg
  yield('hello world') if block_given?
end

do_something_with_an_arg do |arg|
  puts "the message is #{arg}"
end

