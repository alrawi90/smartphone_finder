class SmartphoneFinder::Brand

    @@all=[]
    attr_accessor :name ,:url ,:devices
	def initialize(name,url)
		@devices=[]
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
	    puts "----------------------------------------------------------------"

		
	end
	def add_device(device)
		self.devices << device
	end
	def list_devices
		counter=1
		self.devices.each do |device|
			puts "#{counter}- #{device.name}"
			counter +=1
		end
		puts "----------------------------------------------------------------"
			end
	
end