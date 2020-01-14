class User < ActiveRecord::Base
    has_secure_password

    validates :username, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {minimum: 3, maximum: 14}
    validates_format_of :username, :with => /^[a-zA-Z0-9](\w|\.)*[a-zA-Z0-9]$/, :multiline => true
    validates :password, length: {minimum: 8, maximum: 30}


    def to_param
        username
    end

    #instead of using an id will use site.com/users/#username to show profile
end