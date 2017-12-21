class Order < ActiveRecord::Base
  belongs_to :cashier, class_name: 'User', foreign_key: :cashier_id
  belongs_to :baker, class_name: 'User', foreign_key: :baker_id
  scope :pending, -> { where(status: 'pending') }
  scope :processing, -> { where(status: 'processing') }
  scope :ready_for_pick_up, -> { where(status: 'pick_up') }
  scope :completed, -> { where(status: 'completed') }
  scope :is_current_order, -> { where(current_order: true) }
  scope :today_orders, -> { where("pick_up > ? AND pick_up < ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)}
  validate :pick_up_must_be_in_future
  validate :only_one_current_order_update
  validates_uniqueness_of :current_order, conditions: -> { where(current_order: true) } 

  PIZZA_TYPES = %w( cheese pepperoni hawaiian veggie )
  PIZZA_SIZES = %w( small medium large )

  private
  # can't place order in the past
  def pick_up_must_be_in_future
    if pick_up < DateTime.now
    	errors.add(:pick_up, 'Must be in future')
    end
  end

  def only_one_current_order_update
    if Order.is_current_order.present? && Order.is_current_order.where("id != ?", id).present?
    	errors.add(:current_order, "One at a Time")
    end
  end
end