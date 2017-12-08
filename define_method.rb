# def hello_world
#   "hello world"
# end

def method_missing(name, *args)
  'hello world' if name == 'hello_world'
end

start = Time.now
1000000.times do
  hello_world
end
puts Time.now - start