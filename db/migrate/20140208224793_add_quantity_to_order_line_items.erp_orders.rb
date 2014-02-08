# This migration comes from erp_orders (originally 20130620203217)
class AddQuantityToOrderLineItems < ActiveRecord::Migration
  def up
    unless columns(:order_line_items).collect {|c| c.name}.include?('quantity')
      add_column :order_line_items, :quantity, :integer
    end
  end

  def down
    if columns(:order_line_items).collect {|c| c.name}.include?('quantity')
      remove_column :order_line_items, :quantity
    end
  end
end
