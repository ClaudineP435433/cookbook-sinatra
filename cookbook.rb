require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    read_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def remove_all_recipe
    @recipes = []
    write_csv
  end

  def recipe_as_done(recipe_index)
    @recipes[recipe_index].mark_as_done!
    write_csv
  end

  def read_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @recipes << Recipe.new(name: row['name'], description: row['description'], cooking_time: row['cooking_time'], difficulty: row['difficulty'], done: (row['done']=='true'), photo: row['photo'])
    end
  end

  def write_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['name', 'description', 'cooking_time', 'difficulty', 'done', 'photo']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time, recipe.difficulty, recipe.done, recipe.photo]
      end
    end
  end
end

