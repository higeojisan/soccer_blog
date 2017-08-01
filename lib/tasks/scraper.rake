require 'open-uri'
require 'openssl'

namespace :scraper do
    
    desc 'SOCCERKINGから新着記事を取得する'
    
    task :soccer_king => :environment do
        url = 'https://www.soccer-king.jp/news/all'
        charset = nil
        
        begin
            html = open(url, {:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE}) do |f|
                charset = f.charset
                f.read
            end
        rescue => ex
            ## エラー通知処理
            puts ex.message
        end
            
        doc = Nokogiri::HTML.parse(html, nil, charset)
        latest_news = doc.css('.news-category-list__vertical')
        latest_news.each do |news|
            ## 要素の取得
            link_url = news.css('a').attribute('href').value.strip
            image_url = news.css('img').attribute('src').value.strip
            title = news.css('.news-category-list__vertical__title').inner_text.strip
            content = news.css('.news-category-list__vertical__excerpt').inner_text.strip
            
            ## link_urlとimage_urlのバリデーション
            regexp = %r%^https://www\.soccer-king\.jp%
            unless regexp =~ link_url && regexp =~ image_url
                ## バリデーションに失敗した場合は保存しない
                continue
            end
            
            ## データの保存
            article = Article.new
            article.link_url = link_url
            article.image_url = image_url
            article.title = title
            article.content = content
            begin
                article.save!
            rescue => ex
                ## エラー通知処理
                ## uniquenceかpresenceで通知を分ける
                puts ex.message
            end
        end
    end
end    