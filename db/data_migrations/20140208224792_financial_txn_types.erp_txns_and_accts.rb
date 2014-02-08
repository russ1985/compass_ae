# This migration comes from erp_txns_and_accts (originally 20101014142230)
class FinancialTxnTypes
  
  def self.up
    BizTxnType.create(
      :description => "Payment Transaction",
      :internal_identifier => 'payment_txn'
    )
  end
  
  def self.down
    type = BizTxnType.iid('payment_txn')
    type.destroy unless type.nil?
  end

end
