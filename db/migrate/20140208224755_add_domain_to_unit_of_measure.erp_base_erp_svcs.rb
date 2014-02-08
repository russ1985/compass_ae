# This migration comes from erp_base_erp_svcs (originally 20130926023541)
class AddDomainToUnitOfMeasure < ActiveRecord::Migration
  def up
    unless columns(:unit_of_measurements).collect {|c| c.name}.include?('domain')
      add_column :unit_of_measurements, :domain, :string
    end
  end

  def down
    if columns(:unit_of_measurements).collect {|c| c.name}.include?('domain')
      remove_column :unit_of_measurements, :domain
    end
  end
end
