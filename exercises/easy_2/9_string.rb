name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# output => BOB, BOB // beacause .upcase! mutated the object 'Bob'