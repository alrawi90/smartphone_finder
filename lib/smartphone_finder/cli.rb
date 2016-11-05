class SmartphoneFinder::CLI
	def start
     welcome
     menu
	end

	def welcome
		puts "welcome to Smartphone Finder version 1.0"
	end
    def list
    	puts ""
    	puts "----------------------------------------------------------"
    	puts "1- option 1 #print \'1\' to do .."
    	puts "2- option 1 #print \'2\' to do .."
    	puts "3- Exit     #print \'3\' to End application."
    	puts "----------------------------------------------------------"

    	puts""
    def search_by_brand
    	#call scraper to extract brands list
    	puts "Geting Brands ..."
    	SmartphoneFinder::Scraper.get_brands
    	puts ""
    	puts "Listing brands ..."
        SmartphoneFinder::Brand.list_all
        #ask user to choose brand index to list relative devices
        puts""
        puts"print brand index to list relative devices"
        input=gets.strip
        if input.to_i >0
        	#call scraper to extract devices list
        	brand=SmartphoneFinder::Brand.all[input.to_i-1]
        	SmartphoneFinder::Scraper.get_devices_by_brand(brand)
        	#listing devices .....
        	puts""
        	puts"listing devices ....."
        	brand.list_devices
        	#ask user to choose device index to show specifications
            puts ""
            puts "print device index to view relative specifications"
            input =gets.strip
            if input.to_i >0
               device=SmartphoneFinder::Device.all[input.to_i-1]
               #SmartphoneFinder::Device.list_all
        	   SmartphoneFinder::Scraper.get_device_spec(device)
        	   device.specifications.display
        	else
        	puts"invalid option"  
        	end

        else
        	puts "invalid input"
         end
    	end	
    def search_by_keyword
    	 "I'm option_2"
    	end	
    end
	def menu
		list
		puts "choose an option please"
		input=nil
		while(input !="3")
			puts""
			input=gets.strip
         if input =="1"
            search_by_brand
         elsif input =="2"
            search_by_keyword
         elsif input=="3"
            	  puts "exit" 
         else
         	
        end
		end
	end
end