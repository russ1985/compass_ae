# This migration comes from erp_txns_and_accts (originally 20130408195119)
class AddBizTxnAcctTypeIdToBizTxnAcctRoot < ActiveRecord::Migration
  def change
    add_column :biz_txn_acct_roots, :biz_txn_acct_type_id, :integer
  end
end
