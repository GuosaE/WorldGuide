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
        input = gets.chomp
        if input == 'exit' || input == 'Exit'
            'exit'
    end

end