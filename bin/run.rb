require_relative '../config/environment'
require_relative '../lib/cli'

username = get_user_name
new_user = create_or_find_user(username)
choose_shopping_list

