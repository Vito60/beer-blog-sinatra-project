class User < ActiveRecord::Base
    has_many :blog
    has_many :comments
    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true
end
