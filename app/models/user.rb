class User < ActiveRecord::Base
    has_secure_password

    has_many :sams
    has_many :reviews

    validates :username, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {minimum: 3, maximum: 20}
    validates_format_of :username, :with => /^[a-zA-Z0-9](\w|\.)*[a-zA-Z0-9]$/, :multiline => true
    validates :password, length: {minimum: 8, maximum: 30}


    def to_param
        username
    end

    #instead of using an id will use site.com/users/#username to show profile
    #The to_param method on ActiveRecord objects uses, by default, just the
    #ID of the object. By putting this code in your model, you're overwriting the
    #ActiveRecord default, so when you link to a User, it will use the username for the
    #paramater instead of the id

    def self.from_omniauth(auth)
        where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end

    def self.create_from_omniauth(auth)

        random_username = auth["info"]["name"].gsub!(" ", "") + "#{rand(1..3000)}"

        #create a random username with numbers from the name provided by facebook

        user = User.find_by(username: random_username)

        if user != nil #if a user shares a name and gets the same assigned number
            #then it creates a user with a different number

            create! do |user|
                user.provider = auth["provider"]
                user.uid = auth["uid"]
                user.username = auth["info"]["name"].gsub!(" ", "") + "#{rand(1..3000)}"
                user.password = SecureRandom.urlsafe_base64 #assigns random password to fulfill other validations
                #password can be unknown to user because real validation and security is done through facebook
            end
        else
            create! do |user|
                user.provider = auth["provider"]
                user.uid = auth["uid"]
                user.username = random_username
                #if a user of random_username does not exist, then use random_username
                user.password = SecureRandom.urlsafe_base64
            end
        end
    end
end