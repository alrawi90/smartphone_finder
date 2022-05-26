require 'open-uri'
class SmartphoneFinder::Scraper
    DOMAIN="http://gsmarena.com/"


	def self.get_brands
	  html= URI.open(DOMAIN)
	  scrapped=Nokogiri::HTML(html)	
	  scrapped.css(".brandmenu-v2 ul li a").each do |e|

	  	   SmartphoneFinder::Brand.new(e.text ,e.attribute("href").value)

	  end
	end
	def self.get_devices_by_brand(brand)
		url=brand.url
	  html= URI.open(DOMAIN+url)
	  scrapped=Nokogiri::HTML(html)	
	  scrapped.css(".makers ul li a").each do |a|
	  device=SmartphoneFinder::Device.new(a.css("span").text,a.attribute("href").value,brand)
      brand.add_device(device)
	  end
	end
   def self.get_device_spec(device)
   	  spec_table=""
   	  url=device.url
	  html= URI.open(DOMAIN+url)
	  scrapped=Nokogiri::HTML(html)	
	  scrapped.css("#specs-list table").each do |table|
	  	spec_table=spec_table + table.css("th").text + ":\n"
	  	table.css("tr").each do |tr|
	  		spec_table=spec_table + "  " + tr.css(".ttl a").text + " - " + tr.css(".nfo").text + "\n"
	  	end
	    spec_table=spec_table + "--------------------------------------------------------------\n"
	end
    device.specifications= SmartphoneFinder::Specifications.new(device,spec_table)
   end
   def self.get_by_keyword(keyword)
         self.get_brands
         search_results=[]
         html =  URI.open(DOMAIN+"results.php3?sQuickSearch=yes&sName="+keyword)
         scrapped = Nokogiri::HTML(html)
         scrapped.css("div.makers ul a").each do |a|
            device_name_no_php=a.attribute("href").value.split("-")
            device_name_collector=device_name_no_php[0].split("_");
            brand=SmartphoneFinder::Brand.find_by_name(device_name_collector[0])
            device_name_collector.shift
            device_name=device_name_collector.join(" ")
            device=SmartphoneFinder::Device.new(device_name,a.attribute("href").value,brand)
            brand.add_device(device)
            search_results.push(brand.name + ": " +device_name)
         end
         search_results
   end
end