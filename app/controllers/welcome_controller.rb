class WelcomeController < ApplicationController
  def index
    cities = ['Miami', 'Diadema', 'NYC', 'Sao Paulo', 'Orlando']
    fruits = ['Manana', 'Molango', 'Bacate', 'Acabaxi', 'Tomatch']

    @list = []
    cities.each do|city|
      fruits.each do |fruit|
        @list.push({city: city, product: fruit, count: rand(10..100)})
      end
    end

    puts @list

    # this will hold the crosstab
    @myCities = {}

    # this will hold the unique products for the header
    @uniqProducts = {}

    # Creating crosstab structure
    @list.each do |row|
      cityName    = row[:city]
      productName = row[:product]
      @uniqProducts[ productName ] = true;

      # cria um hash vazio se aquela chave ainda nao existe  
      @myCities[ cityName ] = {} if @myCities[ cityName ].nil?

      @myCities[ cityName ][ productName ] = row[:count]
    end
  end
end
