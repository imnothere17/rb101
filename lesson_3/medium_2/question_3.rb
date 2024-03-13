def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
# output => nothing was mutated becaues += is a re-assignment and is pointing to a different object.
puts "String_arg_two looks like this now: #{string_arg_two}"
# output => the object was mutated because of << method.