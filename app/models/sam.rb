class Sam < ActiveRecord::Base
    belongs_to :user
    has_many :reviews
    #has_many :points

    scope :newest, -> { order('created_at DESC') }
    #active record scope method, used to display newest on homepage

    validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {minimum: 5, maximum: 40}
    validates_format_of :name, :with => /^[A-Za-z0-9 ]+ [A-Za-z0-9 ]+$/, :multiline => true
    #can include numbers or letters, must contain space, but cant have spaces at beginning or end
    validates :description, :presence => true, :uniqueness => true, :length => {minimum: 10, maximum: 2000 }
    validates :image_url, :presence => true, :url => true
end