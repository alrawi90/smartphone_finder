class SmartphoneFinder::Specifications
	attr_accessor :device ,:data
	def initialize(device,data)
		@device=device
		@data=data
	end
	def display
		puts data
	end
end