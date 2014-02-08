# This migration comes from compass_ae_saas (originally 20140207214019)
class AddSaasColumnsToInstances < ActiveRecord::Migration
  def change
    add_column :compass_ae_instances, :instance_url, :string
    add_column :compass_ae_instances, :code_url, :string
  end
end
