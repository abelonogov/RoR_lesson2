class Pet
  
  def initialize(name, type)
    @name = name.capitalize
    @type = type
    @hp = 100
    @mood = 10
    @want_eat = 0
    @want_sleep = 0
    @want_drink = 0
    @attempts = 0
    @age = 1
    @all_actions = ["sleep", "drink", "eat", "wash"]
    puts "Congradulation! Your pet was born"
  end
  
  def put_to_sleep
    check_hp
    check_age
    show_progress('Sleeping')
    @want_drink += (rand(4)+1)
    @want_eat += (rand(4)+1)
    @mood = 0
    @want_sleep = 0
    @age += 1
  end
  
  def give_water
    check_hp
    check_age
    show_progress('Drinking')
    @want_drink += (rand(4)+1)
    @mood -= (rand(2)+1)
    @hp -= (rand(100)+1)
    if @want_drink >= 10
      show_no_more_message('drink')
      @want_drink = 10
    end
    if @mood <= 0
      show_want_message('sleep')
      @mood = 0
    end
    if @hp <= 25
      puts "Watter was too cold and your pet is ill. Please treat him"
      @hp = 0
    end
    @age += 1
  end
  
  def give_a_wash
    check_hp
    check_age
    show_progress('Washing')
    @want_eat += (rand(4)+1)
    @want_sleep += (rand(4)+1)
    @want_drink += (rand(4)+1)
    @mood -= (rand(2)+1)
    if @mood <= 0 || @want_sleep >= 10
      show_want_message('sleep')
      @mood = 0
      @want_sleep = 10
    end
    if @want_eat >= 10
      show_want_message('eat')
      @want_eat = 10
    end
    if @want_drink >= 10
      show_want_message('drink')
      @want_drink = 10
    end
    @age += 1
  end
  
  def treat
    @hp = 100
    puts "Woo Hoo. Your pet are healthy again"
    @age += 1
  end
  
  def comb
    check_hp
    check_age
    show_progress('Combing')
    @mood += (rand(2)+1)
    if @mood >= 10
      show_no_more_message('comb')
      @mood = 10
      show_want_message(@all_actions.sample)
    end
    @age += 1
  end
  
  def play_a_little
    check_hp
    check_age
    show_progress('Playing')
    @hp -= (rand(100)+1)
    @want_eat += (rand(4)+1)
    @want_sleep += (rand(4)+1)
    @want_drink += (rand(4)+1)
    if @want_sleep >= 10
      show_want_message('sleep')
      @want_sleep = 10
    end
    if @want_eat >= 10
      show_want_message('eat')
      @want_eat = 10
    end
    if @want_drink >= 10
      show_want_message('drink')
      @want_drink = 10
    end
    if @hp <= 25
      puts "The weather is too cold and your pet is ill. Please treat him"
      @hp = 0
    end
    @age += 1
  end
  
  def feed
    check_hp
    check_age
    show_progress('Eating')
    @want_eat = 0
    @want_sleep += (rand(4)+1)
    @want_drink += (rand(4)+1)
    if @want_sleep >= 10
      show_want_message('sleep')
      @want_sleep = 10
    end
    if @want_drink >= 10
      show_want_message('drink')
      @want_drink = 10
    end
    @age += 1
  end
  
  def die
    puts "You are a bad! Your pet is dead!"
    exit
  end
  
  def show_info
    puts "Type - #{@type}"
    puts "Name - #{@name}"
    puts "Health - #{@hp}"
    puts "Mood - #{@mood}"
    puts "Degree of hungry - #{translate_value(@want_eat)}"
    puts "Degree of fatigue - #{translate_value(@want_sleep)}"
    puts "Degree of thirst - #{translate_value(@want_drink)}"
    puts "Age - #{@age}"
  end
  
  def help
    puts "You can do next actions with your pet"
    puts "1 - Feed"
    puts "2 - Give water"
    puts "3 - Give a wash"
    puts "4 - Comb"
    puts "5 - Treat"
    puts "6 - Put to sleep"
    puts "7 - Play with your pet"
    puts "8 - Get info about your pet"
  end
  
  private
  
  def check_age
    if @age >= 15
      puts "Your pet is too old..."
      sleep 3
      die
    end
  end
  
  def check_hp
    if @attempts != 3
      @attempts += 1
      puts "Your pet is still ill. Please treat him" and return
    else
      die
    end if @hp <= 25
  end
  
  def show_no_more_message(action)
    puts "Your pet don\'t want #{action} anymore"
  end
  
  def show_want_message(action)
    puts "Your pet want #{action} now"
  end
  
  def translate_value(value)
    case value
    when 0..2
      "low"
    when 3..6
      "medium"
    when 7..10
      "high"
    end
  end
  
  def show_progress(action)
    print "\n"
    (1..20).each do |step|
      p = '.'*step
      print "\r#{action}#{p}"
      sleep(0.1)
    end
    print "\n"
  end
  
end

puts "Please choose your animal - dog, cat or chicken"
type = gets.chomp
puts "Please choose name for your animal"
name = gets.chomp
pet = Pet.new(name, type)
pet.show_info
pet.help

begin
  puts "What do you want to do with your pet? Make your choice or print \'help\' for show help"
  command = gets.chomp
  case command
  when "1"
    pet.feed
  when "2"
    pet.give_water
  when "3"
    pet.give_a_wash
  when "4"
    pet.comb
  when "5"
    pet.treat
  when "6"
    pet.put_to_sleep
  when "7"
    pet.play_a_little
  when "8"
    pet.show_info
  when "help"
    pet.help
  else
    puts "Please choose correct action or print \'help\' to get help"
  end
end until command == 'quit'

puts "Bye Bye! See you soon!"