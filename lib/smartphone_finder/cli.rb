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
    def option_1
    		 "I'm option_1"
    	end	
    def option_2
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
            puts option_1
         elsif input =="2"
            puts option_2
         elsif input=="3"
            	  puts "exit" 
         else
         	
        end
		end
	end
end