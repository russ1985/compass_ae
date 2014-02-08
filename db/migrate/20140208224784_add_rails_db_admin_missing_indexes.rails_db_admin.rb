# This migration comes from rails_db_admin (originally 20131112013053)
class AddRailsDbAdminMissingIndexes < ActiveRecord::Migration
  def up

    if indexes(:reports).select {|index| index.name == 'reports_internal_identifier_idx'}.empty?
      add_index :reports, :internal_identifier, :name => 'reports_internal_identifier_idx'
    end

  end

  def down

    unless indexes(:reports).select {|index| index.name == 'reports_internal_identifier_idx'}.empty?
      remove_index :reports, :internal_identifier
    end

  end
end
