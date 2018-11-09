class Message < ActiveRecord::Base
    validates :email, presence: true
    validates :title, presence: true, length: { minimum: 5, maximum: 50}
    validates :description, length: { maximum: 500 }
end