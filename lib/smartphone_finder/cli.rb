class SmartphoneFinder::CLI
	  @search_results=[]
    attr_accessor :search_results
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
    end	
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
    def list_results #this method will print in 3 colomns
		counter=0
		indention=" "
		extra=" "	
		width=50

		while counter <self.search_results.size
			counter <9 ? extra=" " : extra=""
			if self.search_results.size - counter  >=3
             col_1=self.search_results[counter]; col_1_spc=indention*(width - col_1.length)
             col_2=self.search_results[counter+1] ;col_2_spc=indention*(width - col_2.length)
             col_3=self.search_results[counter+2];

             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}#{col_2_spc}#{counter+3}- #{extra}#{col_3}"
            elsif self.search_results.size - counter  >=2
             col_1=self.search_results[counter]; col_1_spc=indention*(width - col_1.length)
             col_2=self.search_results[counter+1];
             puts "#{counter+1}- {extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
            elsif self.search_results.size - counter  >=1
             col_1=self.search_results[counter];
             puts "#{counter+1}- #{extra}#{col_1}"

			end
			counter+=3
		end

	    puts "----------------------------------------------------------------"

		
	end
    def search_by_keyword
    	 keyword=gets.strip
    	 self.search_results= SmartphoneFinder::Scraper.get_by_keyword(keyword)
    	 list_results

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