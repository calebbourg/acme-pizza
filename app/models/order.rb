class Order < ActiveRecord::Base
  belongs_to :user
  scope :pending, -> { where(status: 'pending') }
  scope :processing, -> { where(status: 'processing') }
  scope :ready_for_pick_up, -> { where(status: 'pick_up') }
  scope :completed, -> { where(status: 'completed') }
  validate :pick_up_must_be_in_future

  PIZZA_TYPES = %w( cheese pepperoni hawaiian veggie )
  PIZZA_SIZES = %w( small medium large )

  private
  # can't place order in the past
  def pick_up_must_be_in_future
    if pick_up < DateTime.now
    	errors.add(:pick_up, 'Must be in future')
    end
  end
end