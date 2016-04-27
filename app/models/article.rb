class Article < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 3, maxmum: 50}
    validates :description, presence: true, length: {minimum: 10, maxmum: 300}
    belongs_to :user
    validates :user_id, presence: true
end