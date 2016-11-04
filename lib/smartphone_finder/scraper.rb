class SmartphoneFinder::Scraper
DOMAIN="http://gsmarena.com"	
def self.get_brands
  html= open(DOMAIN)
  brands=[]
  scrapped=Nokogiri::HTML(html)	
  brands=scrapped.css(".brandmenu-v2 ul li a").each do |e|
  	#puts e.text + " & " + e.attribute("href").value
  	SmartphoneFinder::Brand.new(e.text ,e.attribute("href").value)
  end
end

end