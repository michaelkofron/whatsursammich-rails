class Sam < ActiveRecord::Base
    belongs_to :user
    has_many :reviews
    #has_many :points

    scope :newest, -> { order('created_at DESC') }
    scope :popular, -> { Sam.all.sort_by{ |a| -a.reviews.count} }
    #active record scope methods, used to display newest and popular on homepage

    validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {minimum: 5, maximum: 40}
    validates_format_of :name, :with => /^[A-Za-z0-9 ]+ [A-Za-z0-9 ]+$/, :multiline => true
    #can include numbers or letters, must contain space, but cant have spaces at beginning or end
    validates :description, :presence => true, :uniqueness => true, :length => {minimum: 10, maximum: 2000 }
    validates :image_url, :presence => true, :url => true

    def self.popularity
        count = 0
        if self.reviews
            count = self.reviews.count
        else 
            count
        end
    end
end