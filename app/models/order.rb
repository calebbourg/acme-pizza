class Order < ActiveRecord::Base
  belongs_to :user
  scope :pending, -> { where(status: 'pending') }
  scope :processing, -> { where(status: 'processing') }
  scope :ready_for_pick_up, -> { where(status: 'pick_up') }
  scope :completed, -> { where(status: 'completed') }

  PIZZA_TYPES = %w( cheese pepperoni hawaiian veggie )
  PIZZA_SIZES = %w( small medium large )

end