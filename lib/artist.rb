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
        

    # This class method should take the name that is passed in (remember, it will be a string), and do one of two things. Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.

end