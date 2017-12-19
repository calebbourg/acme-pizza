class Order < ActiveRecord::Base
  belongs_to :user

  PIZZA_TYPES = %w( cheese pepperoni hawaiian veggie )
  PIZZA_SIZES = %w( small medium large )

end