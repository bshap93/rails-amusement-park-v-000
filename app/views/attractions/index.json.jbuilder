json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :tickets, :nausea_rating, :happiness_rating, :min_height
  json.url attraction_url(attraction, format: :json)
end
