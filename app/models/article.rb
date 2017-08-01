class Article < ActiveRecord::Base
    validates :link_url,:image_url,:title,:content, presence: true
end
