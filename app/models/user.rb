class User < ActiveRecord::Base
    has_secure_password

    validates :username, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {minimum: 3, maximum: 14}
    validates_format_of :username, :with => /^[a-zA-Z0-9](\w|\.)*[a-zA-Z0-9]$/, :multiline => true
    validates :password, length: {minimum: 8, maximum: 30}


    def to_param
        username
    end

    def self.from_omniauth(auth)
        where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end

    def self.create_from_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.username = auth["info"]["name"].gsub!(" ", "")
            user.password = SecureRandom.urlsafe_base64
        end
    end

    #def password_validator
        #if self.provider == nil
            #validates :password, length: {minimum: 8, maximum: 30}
        #end

   #end

    #instead of using an id will use site.com/users/#username to show profile
end