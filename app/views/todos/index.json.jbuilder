json.array!(@todos) do |todo|
  json.extract! todo, :id, :details
  json.url todo_url(todo, format: :json)
end
