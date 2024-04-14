class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_sneaker(sneaker)
    item = find_item(sneaker)
    if item
      item.increment(:quantity)
    else
      item = line_items.build(sneaker_id: sneaker.id, quantity: 1)
    end
    item
  end

  def remove_sneaker(sneaker)
    item = find_item(sneaker.id)
    return unless item

    item.decrement(:quantity) if item.quantity > 0

    item.destroy if item.quantity.zero?
    item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def sneaker_count(sneaker)
    find_item(sneaker.id)&.quantity || 0
  end

  private

  def find_item(sneaker_id)
    line_items.find_by(sneaker_id:)
  end
end
