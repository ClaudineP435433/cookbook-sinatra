class Parsing

  def self.scrap_list(keyword)
    url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}"
    # to be created to scrap data
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    recipes_data = []
    html_doc.search('.recipe-card').each_with_index do |element, index|
      recipes_data << {
        name: element.search('h4').text,
        description: element.search('.recipe-card__description').text.strip,
        link: element.attribute('href').value,
        photo: html_doc.search('.recipe-card__picture img').attribute('src').value
      }
    end
    return recipes_data
  end

  def self.scrap_recipe(link)
    url = "http://www.marmiton.org/#{link}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    recipe_detail = {
        cooking_time: html_doc.search('.recipe-infos__total-time__value').text.strip,
        difficulty: html_doc.search('.recipe-infos__level').text.strip
      }
    return recipe_detail
  end

end
