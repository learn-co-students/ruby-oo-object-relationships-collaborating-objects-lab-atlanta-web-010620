class MP3Importer 
    attr_accessor :path 
    # instance variables 
    def initialize(path) 
        @path = path 
    end   

    # instance methods 
    def files 
        song_files = Dir[path+"/*.mp3"]
        song_files.each {|song| song.slice! path+"/"}
    end 

    def import 
        self.files.each {|file| Song.new_by_filename(file.split(" - ")[1])}
    end 
    # class variables 

    # class methods 
end 