str = "rip 'get this'"
str =~ /\s+'(.*)'/ # lazy med(.*?) verkar inte behövas
puts $1