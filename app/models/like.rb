class Like < ActiveRecord::Base
  belongs_to :user, polymorphic: true
  belongs_to :story, polymorphic: true



end
