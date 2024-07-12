Article.delete_all

# Generate 100 articles
titles = Set.new
while titles.size < 100
  title = Faker::Movie.unique.title
  titles.add(title)
end
titles.each do |title|
  Article.create!(
    title: title,
  )
end

puts "Seeded 100 articles"
