class User < ActiveRecord::Base
    has_secure_password

    validates :username, :presence => true
    validates :username, :uniqueness => true
    validates :password, length: {minimum: 8}


    def to_param
        username
    end

    #instead of using an id will use site.com/users/#username to show profile
end