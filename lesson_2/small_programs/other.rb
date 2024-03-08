def every_other(numbers)
  other_numbers = []
  
  numbers.each_with_index do |val, idx|
    if idx.even?
      other_numbers << val
    else
      next
    end
  end

  other_numbers
end



p every_other([1,4,7,2,5])

