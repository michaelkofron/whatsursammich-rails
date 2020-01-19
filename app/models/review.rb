class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :sam

    validates :body, :presence => true

end