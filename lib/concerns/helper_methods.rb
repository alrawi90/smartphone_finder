module HelperMethods

def obj_exist?
   self.class.all.detect{|obj| obj.name == self.name}
 end
def list_all(array,option) #this method will print brands in 3 colomns
		counter=0
		sep= "----------------------------------------------------------------"
		indention=" "
		extra=" "	
        if option=="1"
        	    object=array.max{|a, b| a.name.length <=> b.name.length}
        	    width= object.name.length + 5
				while counter <array.size
					counter <9 ? extra=" " : extra=""
					if array.size - counter  >=3
		             col_1=array[counter].name ; col_1_spc=indention*(width - col_1.length)
		             col_2=array[counter+1].name ;col_2_spc=indention*(width - col_2.length)
		             col_3=array[counter+2].name ;

		             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}#{col_2_spc}#{counter+3}- #{extra}#{col_3}"
		            elsif array.size - counter  >=2
		             col_1=array[counter].name ; col_1_spc=indention*(width - col_1.length)
		             col_2=array[counter+1].name ;
		             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
		            elsif array.size - counter  >=1
		             col_1=array[counter].name ;
		             puts "#{counter+1}- #{extra}#{col_1}"

					end
					counter+=3
				end
	
			
		else
            object =array.max{|a, b| a.length <=> b.length}
        	width=object.length + 5
    		while counter <array.size
	    	     counter <9 ? extra=" " : extra=""
	             if array.size - counter  >=3
	                 col_1=array[counter]; col_1_spc=indention*(width - col_1.length)
	                 col_2=array[counter+1] ;col_2_spc=indention*(width - col_2.length)
	                 col_3=array[counter+2];

	                 puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}#{col_2_spc}#{counter+3}- #{extra}#{col_3}"
	              elsif array.size - counter  >=2
	                 col_1=array[counter]; col_1_spc=indention*(width - col_1.length)
	                 col_2=array[counter+1];
	                 puts "#{counter+1}- {extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
	              elsif array.size - counter  >=1
	                 col_1=array[counter];
	                 puts "#{counter+1}- #{extra}#{col_1}"

	    			    end
	    			counter+=3
	    		end
	    		
        end
        2.times do
          puts sep*2
        end  
    end
		
end