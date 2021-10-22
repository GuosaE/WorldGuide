require 'pry'

class CommandLineInterface

    def greet
        puts "Welcome to Geographica, the best resource on the distribution of languages in countries around the globe!"
    end

    def run
        greet
        puts "To see a list of all regions please enter 'Regions'."
        puts "To see a list of all countries, please enter 'Countries'."
        puts "To see a list of all national languages, please enter, 'Languages'."
        puts "To exit the application, please type 'exit'."
        puts "To see a list of the countries in a specific region, please enter 'Countries by region'."
        puts "To see a list of the countries which speak a specific language, please enter 'Countries by language'."
        puts "To see the region and language information for a particular country, please enter 'Country information'."
        input = gets.chomp
        if input == 'exit' || input == 'Exit'
            'exit'
        elsif input == 'Regions' || input == 'regions'
            puts regions_list_array
            run
        elsif input == 'Countries' || input == 'countries'
            puts countries_list_array
            run
        elsif input == 'Languages' || input == 'languages'
            puts languages_list_array
            run
        end
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

