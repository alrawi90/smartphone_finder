class SmartphoneFinder::Device
    @@all=[]
    attr_accessor :name ,:url ,:brand
	def initialize(name,url)
		@name=name
		@url=url
		@all << self
	end

	def self.all
	  @@all	
	end


end
