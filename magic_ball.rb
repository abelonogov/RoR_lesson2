class MagicBall
  
   VARIANTS_OF_ANSWER = [ "Outlook not so good", "Don\'t count on it", "My sources say no", "Without a doubt", 
                          "Reply hazy", "Try again" , "It is certain", "My reply is no", "As I see it yes", 
                          "Most likely", "You may rely on it", "Cannot predict now", "Outlook good", 
                          "Better not tell you now", "Very doubtful", "Yes definitely", "Concentrate and ask again" ]

  def self.shake
    rand(17)
  end

  def self.show_progress
    print "\n"
    (1..30).each do |step|
      p = '.'*step
      print "\rThinking#{p}"
      sleep(0.1)
    end
    print "\n"
  end

end

puts "Please ask your question:"
question = gets.chomp

MagicBall.show_progress
puts "Your prediction is: #{MagicBall::VARIANTS_OF_ANSWER[MagicBall.shake]}"