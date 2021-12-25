class ProductController < ApplicationController
  def index
    parse
    @products = Product.all
  end

  def fetch_divs
    url = 'https://www.citilink.ru/catalog/smartfony/APPLE/'
    connection = URI.open(url)
    html = connection.read
    nokogiri_doc = Nokogiri::HTML(html)
    connection.close
    nokogiri_doc.search('div.js--ProductCardInListing')
  end

  def parse
    divs = fetch_divs
    divs.each do |div|
      description = div.search('span.ProductCardHorizontal__properties_value')
      price = div.search('span.ProductCardHorizontal__price_current-price').text.strip
      next if description.length != 5

      prod = Product.find_or_create_by(prod_id: div.search('div.ProductCardHorizontal__vendor-code')
                                                     .text.strip.scan(/\d+/)[0])
      prod.name = div.search('a.ProductCardHorizontal__title').text.strip
      prod.os = description[0].text.strip
      prod.screen = description[1].text.strip
      prod.resolution = description[2].text.strip
      prod.cpu = description[3].text.strip
      prod.disk = description[4].text.strip
      prod.price = price.empty? ? 'Нет в наличии' : price
      prod.save
    end
  end
end
