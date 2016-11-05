class SmartphoneFinder::Device
    @@all=[]
    attr_accessor :name ,:url ,:brand ,:specifications
	def initialize(name,url,brand)
		@name=name
		@url=url
		@brand=brand
		@specification=nil
		@@all << self
	end

	def self.all
	  @@all	
	end
	def self.list_all
		counter=1
		self.all.each do |device|
			puts "#{counter}- #{device.url}"
			counter+=1
		end
	    puts "----------------------------------------------------------------"

		
	end

end
