class Recipe
  attr_reader :name, :description, :cooking_time, :difficulty, :done, :photo

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @cooking_time = attributes[:cooking_time]
    @difficulty = attributes[:difficulty]
    @photo = attributes[:photo]
    @done = attributes[:done] || false
  end

  def mark_as_done!
    @done = true
  end

end
