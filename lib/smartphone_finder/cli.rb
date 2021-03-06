require_relative '../concerns/helper_methods.rb'

class SmartphoneFinder::CLI
    include HelperMethods
 	  @search_results=[]

    attr_accessor :search_results
	  def start
       welcome
       menu
	  end

	  def welcome#welcom user and display the current version
		  puts ""
		  puts "welcome to Smartphone Finder version #{SmartphoneFinder::VERSION}"
	  end
    def list
    	puts ""
    	puts "-----------------------Main Menu------------------------------------------------------------#"
    	puts "1- Search by brand   #Enter '1' to browse brands and related devices online on gsmarena.com |"
    	puts "2- Search by keyword #Enter '2' to search for specifed keyword online on gsmarena.com       |" 
    	puts "3- Exit              #Enter '3' to End application.                                         |"
    	puts "--------------------------------------------------------------------------------------------#"
    	puts ""
      puts "choose an option please"

    end	
    def search_by_brand

    	#get and display brands
        show_brands
        #ask user to choose brand index to list relative devices
        puts""
        puts"Enter brand index to list relative devices OR Enter 'menu' to list the main menu"
        input=gets.strip.to_i
        if input>0 && input <= SmartphoneFinder::Brand.all.size
        	#get and display devices
            size=show_devices(input-1)#returns devices number
            #choose a device and get/display device specifications
            puts ""
        	  show_device_spec(size,"1",input-1)
        elsif input > SmartphoneFinder::Brand.all.size
            puts ""
            puts "invalid brand index" 
            search_by_brand     
        else
        	#puts "invalid option" 
        	list 
        	end

    	end	
      def show_brands
	      	#call scraper to extract brands list
	    	puts "Geting Brands ..."
	    	SmartphoneFinder::Scraper.get_brands
	    	puts ""
	    	puts "Listing all brands ..."
	    	puts ""
	      SmartphoneFinder::Brand.list_brands

      end	
      def show_devices(index)
      	  #call scraper to extract devices list
          SmartphoneFinder::Scraper.get_devices_by_brand(SmartphoneFinder::Brand.all[index])
          #listing devices .....
          brand=SmartphoneFinder::Brand.all[index]
          puts ""
          puts "Listing #{brand.name} devices ........"
          puts ""
          (SmartphoneFinder::Brand.all[index]).list_devices  
          return brand.devices.size
      end
  	
      def show_search_results 
    	  puts "Listing search results  ........"
        puts ""
            self.list_all(self.search_results)
    		
	    end
      def search_by_keyword
  	     puts "-------------------------------------------------"
  	     puts "Enter your desired keyword here  OR Enter 'menu' to list the main menu"
  	     keyword = gets.strip
  	     if keyword=="menu"
  	          list
  	     else
  	         self.search_results= SmartphoneFinder::Scraper.get_by_keyword(keyword)
  			 if self.search_results.size>0
  	            show_search_results
  	            show_device_spec(self.search_results.size,"2")
  	     else 
  	          puts "No result meet your search , please try different keyword. Would you like to try again ? Y(es) or N(o)"
  	          response=gets.strip
  	          if response.downcase=="y" || response.downcase=="yes" 
  	            search_by_keyword
  	          else 
  	           list
  	           end 
  	        end
  	     end
	    end
      def show_device_spec(size,option,index=nil)#displaying device specifications
	        if option=="1"
             puts "Enter device index to show related speceifications , Enter '(B)ack' to go to brevious menu , OR Enter 'menu' to list the main menu"
          else 
		          puts "Enter device index to show related speceifications , Enter '(R)etry' to try different keyword , OR Enter 'menu' to list the main menu"
           end
		      input_ = gets.strip
          index_=input_.to_i-1

		      if input_.to_i >0 && input_.to_i <= size
              SmartphoneFinder::Scraper.get_device_spec(SmartphoneFinder::Device.all[index_])
              puts ""
              puts "Displaying specifications for #{(SmartphoneFinder::Device.all[index_]).name} devices ........"
              SmartphoneFinder::Device.all[index_].specifications.display
              puts ""            
              #show navigation options
              puts " Enter 'menu' for main menu , Enter '(B)ack' to go to brevious list "
              response=gets.strip
              if response.downcase=="b" || response.downcase=="back" 
                 #calling the correct method according to the chosen option
                option=="2" ? show_search_results : show_devices(index)
                show_device_spec(size,option, index )
              else 
               list
              end
          elsif input_.to_i > size
            puts ""
            puts "invalid device index"  
            show_device_spec(size,option,index)

          elsif (input_.downcase=="r" || input_.downcase=="retry") && option=="2" 
               search_by_keyword 
          elsif (input_.downcase=="b" || input_.downcase=="back") && option=="1" 
               search_by_brand
          else
            list			   
         end
    end
	
	    def menu
    		list
    		input=nil
    		while(input !="3")
    			puts ""
    			input=gets.strip
             if input =="1"
                search_by_brand
             elsif input =="2"
                search_by_keyword
             elsif input=="3"
             	  puts ""
                puts "Thank you for using Smartphone Finder" 
                puts ""
                break

             else
              puts "invalid input"
              list
            end
	    	end
	    end

end