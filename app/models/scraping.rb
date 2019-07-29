class Scraping
  def self.newsweek_urls
    links = []
    agent = Mechanize.new
    for num in 1..15 do
      agent = Mechanize.new
      if (num == 1) then
        url = "https://www.newsweekjapan.jp/stories/index.php"
        links << url
      else 
        url = "https://www.newsweekjapan.jp/stories/index_#{num}.php"
        links << url
      end
    end

    links.each do |link|
      get_article(link)
    end
  end

  def self.get_article(link)
    agent = Mechanize.new
    page = agent.get(link)

    category = []
    title = []
    date = []
    image_url = []
    article_url = []

    category_elements = page.search('.entryTxt .catch')
    title_elements = page.search('.entryTxt h3')
    date_elements = page.search('.entryTxt .date')
    image_elements = page.search('.entryImg img')
    article_elements = page.search('.entry.clearfix.border_btm.containImg a')

    for i in 0..19 do
      category[i] = category_elements[i].inner_text
      title[i] = title_elements[i].inner_text
      date[i] = date_elements[i].inner_text
      image_url[i] = "https://www.newsweekjapan.jp#{image_elements[i].get_attribute('src')}"
      article_url[i] = "https://www.newsweekjapan.jp#{article_elements[i].get_attribute('href')}"
      Newsweek.create(title: title[i], image: image_url[i], url: article_url[i], category: category[i], date: date[i])
    end
  end
end