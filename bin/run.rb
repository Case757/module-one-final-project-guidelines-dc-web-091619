require_relative '../config/environment'
require_relative '../lib/cli'

list = Cli.new
list.runner


# username = Cli.get_user_name
# new_user = Cli.create_or_find_user(username)
# Cli.choose_shopping_list
# Cli.choose_option

