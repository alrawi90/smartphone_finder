class SmartphoneFinder::Device
    @@all=[]
    attr_accessor :name ,:url ,:brand
	def initialize(name,url,brand)
		@name=name
		@url=url
		@brand=brand
		@@all << self
	end

	def self.all
	  @@all	
	end


end
