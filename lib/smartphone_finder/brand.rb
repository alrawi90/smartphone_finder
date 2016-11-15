require_relative '../concerns/helper_methods.rb'

class SmartphoneFinder::Brand
    include HelperMethods
    extend HelperMethods
    @@all=[]
    attr_accessor :name ,:url ,:devices
	def initialize(name , url)
		@name=name 
		@url= url
		@devices=[]
	   if ! obj_exist?
		@@all.push(self)
	   end
    end
    def self.find_by_name(brand_name)
     	self.all.each do |b|
		  if b.name.downcase==brand_name.downcase 
			return b	
		   end
		end
		return SmartphoneFinder::Brand.new(brand_name,nil)
    end
    def self.all
	   @@all 
     end

    def add_device(device)
      if !self.devices.detect{|obj| obj.name == device.name}
        devices.push(device)
      end
    end
	def self.list_brands
		self.list_all(self.all.collect { |obj| obj.name  })	
	end
	def list_devices
	    self.list_all(self.devices.collect { |obj| obj.name  })
	end
	
end