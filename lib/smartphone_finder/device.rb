require_relative '../concerns/helper_methods.rb'

class SmartphoneFinder::Device
	include HelperMethods
	extend  HelperMethods
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


end
