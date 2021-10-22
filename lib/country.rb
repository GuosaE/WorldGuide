class Country

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


end