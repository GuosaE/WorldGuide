require 'pry'

class CommandLineInterface

    def greet
        puts "Welcome to WorldGuide, the best resource on the distribution of languages in countries around the globe!"
    end

    def run
        greet
        puts "To see a list of all regions, please enter 'Regions'."
        puts "To see a list of all countries, please enter 'Countries'."
        puts "To see a list of all national languages, please enter 'Languages'."
        puts "To see a list of the countries in a specific region, please enter 'Countries by region'."
        puts "To see a list of the countries which speak a specific language, please enter 'Countries by language'."
        puts "To see the region and language information for a particular country, please enter 'Country information'."
        puts "To exit the application, please type 'exit'."
        input = gets.chomp
        if input == 'exit' || input == 'Exit'
            'exit'
        elsif input == 'Regions' || input == 'regions'
            puts " "
            puts regions_list_array
            puts " "
            run
        elsif input == 'Countries' || input == 'countries'
            puts " "
            puts countries_list_array
            puts " "
            run
        elsif input == 'Languages' || input == 'languages'
            puts " "
            puts languages_list_array
            puts " "
            run
        elsif input == 'Countries by region' || input == 'countries by region'
            import_countries
            puts " "
            countries_by_region
            puts " "
            clear_countries
            run
        elsif input == 'Countries by language' || input == 'countries by language'
            import_countries
            puts " "
            countries_by_language
            puts " "
            clear_countries
            run
        elsif input == 'Country information' || input == 'country information'
            import_countries
            puts " "
            country_info
            puts " "
            clear_countries
            run
        else
            puts " "
            puts "Please enter a valid request."
            puts " "
            run
        end
    end



    def regions_list_array
        GetCountries.new.region_names_array
    end

    def countries_list_array
        GetCountries.new.country_names_array
    end

    def languages_list_array
        GetCountries.new.language_names_array
    end

    def import_countries
        Country.import_existing_countries
    end

    def clear_countries
        Country.clear_existing_countries
    end

    def countries_by_region
        puts "Please enter the name of the region to see the countries in that region."
        input = gets.chomp
        if regions_list_array.include?(input)
            selected_countries = Country.all.select { |country|
            country.region.name == input
            }
            selected_countries.each { |selected_country|
                puts selected_country.name
            } 
        else
            puts "Please enter a valid region name."
        end
    end

    def countries_by_language
        puts "Please enter the name of the language to see the countries where it is a national language."
        input = gets.chomp
        if languages_list_array.include?(input)

            Country.all.select do |country|
                if country.language.name != nil
                    country.language.name.each do |element|
                        if element.include?(input) 
                            puts country.name
                        end
                    end
                end
            end
        else 
            puts "Please enter a valid language name."
        end
    end

    def country_info
        puts "Please enter the name of the country to see its region and language information."
        input = gets.chomp
        if countries_list_array.include?(input)
            selected_countries = Country.all.select { |country|
            country.name == input
            }
            selected_countries.each { |selected_country|
                puts "Country: #{selected_country.name}, Region: #{selected_country.region.name}, Languages: #{selected_country.language.name.values.join(", ")}"
            } 
        else
            puts "Please enter a valid country name."
        end
    end

end