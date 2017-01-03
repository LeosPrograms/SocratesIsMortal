json.array!(@syllogisms) do |syllogism|
  json.extract! syllogism, :id, :title, :author, :known, :premises, :conclusion
  json.url syllogism_url(syllogism, format: :json)
end
