# This migration comes from erp_base_erp_svcs (originally 20131211180831)
class AddPostalAddressToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :postal_address_id, :integer
  end
end
