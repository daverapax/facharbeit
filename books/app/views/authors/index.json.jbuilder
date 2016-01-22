json.array!(@authors) do |author|
  json.extract! author, :id, :vorname, :nachname
  json.url author_url(author, format: :json)
end
