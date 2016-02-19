class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  # Uncomment to trigger save errors for testing.
  # validates_numericality_of :post_id, equal_to: 0
end
