class Article < ActiveRecord::Base
    has_many :article_tags
    has_many :tags, through: :article_tags
    
    validates :link_url,:image_url,:title,:content, presence: true
    validates :link_url, uniqueness: true

    paginates_per 10
end
