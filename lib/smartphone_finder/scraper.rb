class SmartphoneFinder::Scraper
DOMAIN="http://gsmarena.com/"


	def self.get_brands
	  html= open(DOMAIN)
	  scrapped=Nokogiri::HTML(html)	
	  scrapped.css(".brandmenu-v2 ul li a").each do |e|

	  	   SmartphoneFinder::Brand.new(e.text ,e.attribute("href").value)

	  end
	end
	def self.get_devices_by_brand(brand)
		url=brand.url
	  html= open(DOMAIN+url)
	  scrapped=Nokogiri::HTML(html)	
	  scrapped.css(".makers ul li a").each do |a|
	  device=SmartphoneFinder::Device.new(a.css("span").text,a.attribute("href").value,brand)
      brand.add_device(device)
	  end
	end

end