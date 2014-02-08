# This migration comes from compass_ae_saas (originally 20130327190805)
class AddSubscription < ActiveRecord::Migration

  def self.up

    unless table_exists?(:subscriptions)
      create_table :subscriptions do |t|
        t.references :billing_account
        t.string :external_identifier
        t.string :external_id_source

        t.timestamps
      end

      add_index :subscriptions, :billing_account_id
      add_index :subscriptions, :external_identifier
    end


  end

  def self.down
    drop_table :subscriptions if table_exists?(:subscriptions)
  end

end
