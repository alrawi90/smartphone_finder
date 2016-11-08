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
    	puts "-----------------------Main Menu------------------------------------------------------------#"
    	puts "1- Search by brand   #print \'1\' to browse brands and related devices online on gsmarena.com |"
    	puts "2- Search by keyword #print \'2\' to search for specifed keyword online on gsmarena.com       |" 
    	puts "3- Exit              #print \'3\' to End application.                                         |"
    	puts "--------------------------------------------------------------------------------------------#"

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
        	#get and display devices
            show_devices(input.to_i-1)
            #choose a device and get/display device specifications
            puts ""
        	show_device_spec("1",input.to_i-1)
        else
        	puts"invalid option" 
        	list 
        	end

 
    	end	
      def show_devices(index)
      	  #call scraper to extract devices list
          SmartphoneFinder::Scraper.get_devices_by_brand(SmartphoneFinder::Brand.all[index])
          #listing devices .....
          puts""
          puts "Listing #{SmartphoneFinder::Brand.all[index].name} devices ........"
          (SmartphoneFinder::Brand.all[index]).list_devices  
      end
  	
    def list_search_results #this method will print in 3 colomns
    	    puts "Listing search results  ........"
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
	     puts"-------------------------------------------------"
	     puts "Print your desired keyword here  OR Print \'menu\' to list the main menu"
	       keyword = gets.strip
	       if keyword=="menu"
	          list
	       else
	         self.search_results= SmartphoneFinder::Scraper.get_by_keyword(keyword)
				if self.search_results.size>0
	            list_search_results
	            show_device_spec("1")
	         else 
	          puts "No result meet your search , please try different keyword. Would you like to try again ? Y(es) or N(o)"
	          response=gets.strip
	          if response=="y" || response=="yes" || response=="Y" || response=="Yes" || response=="YES"
	            search_by_keyword
	           else 
	           list
	           end 
	        end
	     end
	end
    def show_device_spec(option,index=nil)
          puts "Print device index to show related speceifications , Print \'(R)etry\' to try different keyword , OR Print \'menu\' to list the main menu"
          input_ = gets.strip
          index_=input_.to_i-1
          if input_=="menu"
            list
          elsif input_=="R" || input_=="r" || input_=="retry" || input_=="Retry" || input_=="RETRY"
               search_by_keyword 
          else  
            SmartphoneFinder::Scraper.get_device_spec(SmartphoneFinder::Device.all[index_])
            puts "Displaying specifications for #{(SmartphoneFinder::Device.all[index_]).name} devices ........"
            SmartphoneFinder::Device.all[index_].specifications.display
            puts""
            #show navigation options
            puts " Print \'menu\' for main menu , Print \'(B)ack\' to go to brevious list "
             response=gets.strip
            if response=="b" || response=="back" || response=="B" || response=="Back" || response=="BACK"

              option=="2" ? show_search_results : show_devices(index)
              show_device_spec(option, index )
            else 
             list
           end 
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