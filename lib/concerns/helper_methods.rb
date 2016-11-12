module HelperMethods

def obj_exist?
   self.class.all.detect{|obj| obj.name == self.name}
 end
def list_all #this method will print brands in 3 colomns
		counter=0
		indention=" "
		extra=" "	
		width=30

		while counter <self.all.size
			counter <9 ? extra=" " : extra=""
			if self.all.size - counter  >=3
             col_1=self.all[counter].name ; col_1_spc=indention*(width - col_1.length)
             col_2=self.all[counter+1].name ;col_2_spc=indention*(width - col_2.length)
             col_3=self.all[counter+2].name ;

             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}#{col_2_spc}#{counter+3}- #{extra}#{col_3}"
            elsif self.all.size - counter  >=2
             col_1=self.all[counter].name ; col_1_spc=indention*(width - col_1.length)
             col_2=self.all[counter+1].name ;
             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
            elsif self.all.size - counter  >=1
             col_1=self.all[counter].name ;
             puts "#{counter+1}- #{extra}#{col_1}"

			end
			counter+=3
		end

	    puts "----------------------------------------------------------------"
	end
end