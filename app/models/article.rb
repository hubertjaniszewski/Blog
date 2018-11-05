class Article < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: { minimum: 3, maximum: 50}
    validates :description, presence: true, length: { minimum: 5, maximum: 100}
    validates :user_id, presence: true

    def is_shorter_than?(i)
        description.length < i
    end

    def self.test2
        all - [Article.first]
    end
end