class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :sam
    has_many :rpoints

    validates :body, :presence => true, :length => {minimum: 5, maximum: 230}

end