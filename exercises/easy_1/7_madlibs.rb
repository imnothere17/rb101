@pos = { noun: [],
         verb: [],
         adjective: [],
         adverb: []}
                    
def prompt(speech)
  print "Enter 3 #{speech}"
end

def valid_word?(word)
  word.to_i.to_s != word
end

def parts_of_speech(string)
  num = 0
  while num < 3
    print "Enter a #{string}: "
    word = gets.chomp
    
    puts @pos[string.to_sym]
    if valid_word?(word)
      @pos[string.to_sym] << word
      system("clear")
      puts "#{string}: #{@pos[string.to_sym]}"
      num += 1
    else
      puts "Invalid input."
    end
  end
end


parts_of_speech("noun")
noun = @pos[:noun].sample

parts_of_speech("verb")
verb = @pos[:verb].sample

parts_of_speech("adjective")
adjective = @pos[:adjective].sample

parts_of_speech("adverb")
adverb = @pos[:adverb].sample

system("clear")

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
