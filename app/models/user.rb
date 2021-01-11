class User < ApplicationRecord
  belongs_to :access_level
  belongs_to :company
end
