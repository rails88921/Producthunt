
require 'nokogiri'
require 'open-uri'
 

page = 255
(0..page).each do |p| 
	doc = Nokogiri::HTML(open("http://www.producthunt.com/tech?page=#{p}"))
	info = doc.xpath("//html/body/div/div[@class='day']/ul[@class='posts--group']/li/@data-react-props")
	info.each do |i|
		jinfo = JSON.parse(i)
		product = jinfo['name']
		puts product
		product_url = "http://www.producthunt.com" + jinfo['shortened_url']
		puts product_url
		product_final_url = "http://www." + jinfo['name'] + ".com"
		puts product_final_url
		hunter_name = jinfo['hunter']['name']
		seperated_name = hunter_name.split(" ")
		maker1_name = seperated_name.first
		maker1_surname = seperated_name.last
		puts maker1_name
		puts maker1_surname
		jinfo['highlighted_makers'].each do |hm|
			other_seperated_name = hm['name'].split(" ")
			other_maker_name = other_seperated_name.first
			other_maker_surname = other_seperated_name.last
			puts other_seperated_name
			puts other_maker_surname
		end
	end
end 

 

 


