class LineItemsController < AuthedController
  before_action :set_sneaker

  def update
    item = @cart.add_sneaker(@sneaker)
    item.save
  end

  def destroy
    item = @cart.remove_sneaker(@sneaker)
    item.save
  end

  private

  def set_sneaker
    @sneaker = Sneaker.find(params[:sneaker_id])
  end
end
