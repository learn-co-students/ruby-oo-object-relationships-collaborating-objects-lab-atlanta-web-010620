class Song 
    attr_accessor :name, :artist 

    # instance variables 
    def initialize(name) 
        @name = name 
        @@all << self 
    end 

    # instance methods 
    def artist_name=(artist_name) 
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self) 
    end 

    # class variables 
    @@all = [] 

    # class methods 
    def self.all 
        @@all 
    end 

    def self.new_by_filename(filename) 
        song = Song.new(filename.split(" - ")[1])
        # song.artist = filename.split(" - ")[0]
        song.artist_name=(filename.split(" - ")[0])
        song 
    end 
end 