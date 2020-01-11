class Artist 
    attr_accessor :name 

    # instance variables 
    def initialize(name) 
        @name = name 
        @@all << self 
    end 

    # instance methods 
    def add_song(song) 
        song.artist = self
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def print_songs 
        songs.each {|song| puts song.name}
    end 
    
    # class variables 
    @@all = []
    
    # class methods 
    def self.all 
        @@all 
    end 
    
    def self.find_or_create_by_name(name) 
        exist = @@all.select{|artist| artist.name = name}
        if exist == [] 
            new_artist = Artist.new(name) 
        else 
            exist[0]
        end 
    end
    
end