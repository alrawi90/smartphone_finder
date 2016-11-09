require_relative '../concerns/helper_methods.rb'

class SmartphoneFinder::Device
	include HelperMethods
    @@all=[]
    attr_accessor :name ,:url ,:brand ,:specifications
	def initialize(name,url,brand=nil)
	  @specifications=nil
      @name=name
      @url=url
      @brand=brand
      if ! obj_exist?
        @@all.push(self)
       end
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
