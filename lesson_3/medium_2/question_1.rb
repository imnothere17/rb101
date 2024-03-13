a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# output => a and c are pointing at the same object.id