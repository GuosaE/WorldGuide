class Region

    attr_accessor :name, :countries

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def countries
        Country.all.select {|country| country.region == self}
    end

end