json.array! @newsweeks do |newsweek|
  json.image_url newsweek.image
  json.article_url newsweek.url
  json.category newsweek.category
  json.title newsweek.title
  json.date newsweek.date
end