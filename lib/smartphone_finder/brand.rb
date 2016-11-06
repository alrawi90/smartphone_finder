class SmartphoneFinder::Brand

    @@all=[]
    attr_accessor :name ,:url ,:devices
	def initialize(name,url)
		@devices=[]
		@name=name
		@url=url
		@@all << self
	end

	def self.all
	  @@all	
	end
	def self.list_all #this method will print brands in 3 colomns
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
             puts "#{counter+1}- {extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
            elsif self.all.size - counter  >=1
             col_1=self.all[counter].name ;
             puts "#{counter+1}- #{extra}#{col_1}"

			end
			counter+=3
		end

	    puts "----------------------------------------------------------------"

		
	end
	def add_device(device)
		self.devices << device
	end
	def list_devices
		counter=0
		indention=" "
		extra=" "	
		width=30

		while counter <self.devices.size
			counter <9 ? extra=" " : extra=""
			if self.devices.size - counter  >=3
             col_1=self.devices[counter].name ; col_1_spc=indention*(width - col_1.length)
             col_2=self.devices[counter+1].name ;col_2_spc=indention*(width - col_2.length)
             col_3=self.devices[counter+2].name ;

             puts "#{counter+1}- #{extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}#{col_2_spc}#{counter+3}- #{extra}#{col_3}"
            elsif self.devices.size - counter  >=2
             col_1=self.devices[counter].name ; col_1_spc=indention*(width - col_1.length)
             col_2=self.devices[counter+1].name ;
             puts "#{counter+1}- {extra}#{col_1}#{col_1_spc}#{counter+2}- #{extra}#{col_2}"
            elsif self.devices.size - counter  >=1
             col_1=self.devices[counter].name ;
             puts "#{counter+1}- #{extra}#{col_1}"

			end
			counter+=3
		end

	    puts "----------------------------------------------------------------"

	end
	
end