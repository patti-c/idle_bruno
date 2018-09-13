class CommandLineInterface

  # Entry methods

  def greeting
    flatidle_ascii
    $playing = true
    puts "Welcome to Flatidle!"
    puts "You should really be working on labs."
  end

  def flatidle_ascii
    puts File.read('app/ascii/flatidle')
  end

  # Login menu methods

  def log_in_menu
    greeting
    input = get_login_menu_input
    login_menu_reader(input)
  end

  def get_login_menu_input
    prompt = TTY::Prompt.new
    prompt.select("Sign in or create a user.") do |menu|
      menu.choice 'Sign in', 1
      menu.choice 'Create user', 2
    end
  end

  def login_menu_reader(input)
    case input
    when 1
      sign_in
    when 2
      create_user
    end
  end

  def create_user
    username = ask_for_("username")
    password = ask_for_("password")
    name = ask_for_("name")
    $current_user = User.create(username: username, password: password, name: name, brunos: 1, bruno_points: 0)
    enter_main_menu?
    activate_main_menu
  end

  def ask_for_(variable)
    prompt = TTY::Prompt.new
    prompt.ask("Please enter your #{variable}.", required: true)
  end

  def return_to_login_menu?
    prompt = TTY::Prompt.new
    prompt.keypress("Press any key to go back.")
  end

  def sign_in
    username = ask_for_("username")
    password = ask_for_("password")
    if User.find_by(username: username, password: password) != nil
      $current_user = User.find_by(username: username, password: password)
      puts "Welcome, #{$current_user.name}"
    else
      puts "That is not a valid username/password combination."
      return_to_login_menu?
    end
  end

  # Main menu methods

  def enter_main_menu?
    prompt = TTY::Prompt.new
    prompt.keypress("Press any key to go to the main menu.")
  end

  def activate_main_menu
    system('clear')
    while $playing == true
      print "\rYou have #{$current_user.brunos} brunos and #{$current_user.bruno_points} bruno points."
      $current_user.bruno_points += 1
      sleep 0.5
    end
  end

end
