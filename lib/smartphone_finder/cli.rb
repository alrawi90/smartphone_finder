class SmartphoneFinder::CLI
	def self.start
     welcome
     menu
	end

	def self.welcome
		puts "welcome to Smartphone Finder version 1.0"
	end
    def self.list
    	puts ""
    	puts "----------------------------------------------------------"
    	puts "1- option 1 #print \'1\' to do .."
    	puts "2- option 1 #print \'2\' to do .."
    	puts "3- Exit     #print \'3\' to End application."
    	puts "----------------------------------------------------------"

    	puts""
    def self.option_1
    		 "I'm option_1"
    	end	
    def self.option_2
    	 "I'm option_2"
    	end	
    end
	def self.menu
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