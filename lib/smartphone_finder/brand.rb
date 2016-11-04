class SmartphoneFinder::Brand

    @@all=[]
    attr_accessor :name ,:url ,:devices
	def initialize(name,url)
		@name=name
		@url=url
		@@all << self
	end

	def self.all
	  @@all	
	end
	def self.list_all
		counter=1
		self.all.each do |brand|
			puts "#{counter}- #{brand.name}"
			counter+=1
		end
		
	end
	
end