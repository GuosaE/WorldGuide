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


end