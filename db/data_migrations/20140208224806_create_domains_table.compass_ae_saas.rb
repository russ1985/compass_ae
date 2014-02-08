# This migration comes from compass_ae_saas (originally 20110405182850)
class CreateDomainsTable < ActiveRecord::Migration
  def self.up
    unless table_exists?(:domains)
      create_table :domains do |t|
        t.string :host
        t.string :route
        t.integer :compass_ae_instance_id

    	  t.timestamps
      end

      add_index :domains, :compass_ae_instance_id
      add_index :domains, :host, :name => 'domains_host_index'
      add_index :domains, :route, :name => 'domains_route_index'
    end
  end

  def self.down
    if table_exists?(:domains)
      drop_table :domains
    end
  end
end
