class Article < ActiveRecord::Base
    validates :link_url,:image_url,:title,:content, presence: true
    validates :link_url, uniqueness: true
end
