# This migration comes from erp_invoicing (originally 20120229174322)
class AddBillpayWidget
  
  def self.up
    #insert data here
    if Widget.find_by_internal_identifier('billpay').nil?
      app = Application.find_by_internal_identifier('crm')

      billpay = Widget.create(
        :description => 'Bill Pay',
        :internal_identifier => 'billpay',
        :icon => 'icon-grid',
        :xtype => 'billpay'
      )

      app.widgets << billpay
      app.save

    end
  end
  
  def self.down
    #remove data here
    Widget.find_by_internal_identifier('billpay').destroy
  end

end
