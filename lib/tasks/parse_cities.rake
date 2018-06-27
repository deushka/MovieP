
namespace :parse do

  desc "Parse"
  task :cities => :environment do
    require "nokogiri"
    require "open-uri"

    html = Nokogiri::HTML(open("http://kino.kz/new/schedule"))
    # puts html
    html.css("#cinema-form #city-select option").each do |city|
      City.create(name: city.text)
    end
  end

  task :cinemas => :environment do
    require "nokogiri"
    require "open-uri"

    for i in 1..100 do
      html = Nokogiri::HTML(open("http://kino.kz/new/list_cinemas?city=#{i}"))
      html.css("p").each do |cinema|
        cinema.text.split("\"name\":").each do |subCinema|
          if subCinema[0]=="\""
            pos=(subCinema.index("\",\""))
            Cinema.create(name:subCinema[1...pos], city_id: i)
          end
        end
      end
    end
  end

  task :films => :environment do
    require "nokogiri"
    require "open-uri"
    
  end

end
