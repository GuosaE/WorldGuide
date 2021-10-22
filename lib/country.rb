require 'net/http'
require 'open-uri'
require 'json'
require_relative 'region.rb'
require_relative 'language.rb'
require 'pry'

class Country

    URL = "https://restcountries.com/v3/all"

    attr_accessor :name, :region, :language

    @@all = []

    def initialize(name, region = nil, language = nil)
        @name = name
        @region = region
        @language = language
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def language
        @language
    end

    def language=(language)
        @language = language
    end

    def region
        @region
    end

    def region=(region)
        @region = region
    end

    def self.get_country_data
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def self.import_existing_countries
        countries = JSON.parse(self.get_country_data)
        countries.each do |country|
            common_name = country["name"]["common"]
            associated_region = country["region"]
            if country["languages"]
                language_set = country["languages"]
            end
            existing_country = Country.new(common_name) 
            existing_country.region = Region.new(associated_region)
            existing_country.language = Language.new(language_set)
            existing_country.save
            # puts "#{existing_country.name} + #{existing_country.region.name} + #{existing_country.language.name}" 

        end
    end

    def self.clear_existing_countries
        Country.all.clear
    end

end