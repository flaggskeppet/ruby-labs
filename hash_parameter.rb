def some_method (options)
  puts options[:readonly]
  puts options[:mandatory]
end

some_method(:readonly=> true, :mandatory=>false)

