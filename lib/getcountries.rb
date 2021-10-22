require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetCountries

    URL = "https://restcountries.com/v3/all"
    # https://restcountries.com/

    def get_country_data
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def countries
        countries = JSON.parse(self.get_country_data)
    end

    def region_names_array
        regions_array = []
        countries.each do |country|
            region = country["region"]
            regions_array << region
        end
        regions_unique = regions_array.uniq.sort
        regions_unique
    end

    def country_names_array
        common_countries_array = []
        countries.each do |country|
            common_country_name = country["name"]["common"]
            common_countries_array << common_country_name
        end
        common_countries_sorted = common_countries_array.sort
        common_countries_sorted
    end

    def language_names_array
        languages_array = []
        only_names = []
        countries.each do |country|
            if country["languages"]
                language = country["languages"]
                languages_array << language
            end
        end
        languages_array.each do |element|
            element.each do |key, value|
                only_names << value
            end
        end
        language_names_unique = only_names.uniq.sort
        language_names_unique
    end


end