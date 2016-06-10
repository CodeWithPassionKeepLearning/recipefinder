class Recipe
	
include HTTParty
# include httparty
  
  key_value = ENV['FOOD2FORK_KEY'] || '46c4a717c8e4c2de1c3cf45c9e8aacc0'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  # default_params fields: "count,recipes", key: key_value
  default_params fields: "count,recipes", key: key_value
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end