class View
  def display(recipes)
    puts "-"*25
    puts "------ YOUR COOKBOOK -----"
    puts "-"*25
    recipes.each_with_index do |recipe, index|
      done = recipe.done ? "[X]" : "[ ]"
      puts "#{index + 1} - #{done} #{recipe.name}"
      puts " #{recipe.cooking_time} - #{recipe.difficulty}" if (recipe.cooking_time != "")
      puts "#{recipe.description}"
      puts "- " * 20
    end
  end

  def ask_user_for_recipe_description(recipe_name)
    puts "What is the description for your recipe #{recipe_name}?"
    print ">"
    return gets.chomp
  end

  def ask_user_for_recipe_name
    puts "What is the name of your recipe?"
    print ">"
    return gets.chomp
  end

  def ask_user_for_cooking_time(recipe_name)
    puts "What is the cooking time for your recipe #{recipe_name}?"
    print ">"
    return gets.chomp
  end

  def ask_user_for_difficulty(recipe_name)
    puts "What is the difficulty for your recipe #{recipe_name}?"
    print ">"
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print ">"
    return gets.chomp.to_i - 1
  end

  def ask_user_for_ingredient
    puts "What is the name of the ingredient you are looking for ?"
    print ">"
    return gets.chomp
  end

  def loading_recipes(keyword)
    puts ""
    puts "Looking for #{keyword} on Marmitton..."
    puts ""
  end

  def display_list(list)
    list[0..4].each_with_index{ |x, index| puts "#{index + 1} - #{x[:name]}" }
    puts "[...]"
  end

  def ask_user_for_import
    puts "Please type a number to choose which recipe to import"
    print ">"
    return gets.chomp.to_i - 1
  end

end
