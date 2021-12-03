require './app'

@run_command = {
  1 => 'List books',
  2 => 'List people',
  3 => 'Create person',
  4 => 'Create book',
  5 => 'Create rental',
  6 => 'List rentals for a given person id',
  7 => 'Exit'
}


def main
  puts 'Welcome to School Library App!'
  @school = App.new
  @school.open_files
  print_options
end

def print_options
  puts 'Please choose an option by entering a number:'
  @run_command.each do |key, value|
    puts "#{key} - #{value}"
  end
  input = gets.chomp.to_i

  if input == 7
    save_quit
  else
    @school.choose_option(input)
    puts
    print_options
    puts
  end
end

def save_quit
  puts 'Do you want to save data [y/n]!'
  save = gets.chomp.upcase == 'Y'
  @school.save_files if save
  puts 'Thank you for using this App!'
  exit
end

main