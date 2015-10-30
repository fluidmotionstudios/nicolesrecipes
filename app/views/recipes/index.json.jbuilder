json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :user_id
  json.url recipe_url(recipe, format: :json)
end
