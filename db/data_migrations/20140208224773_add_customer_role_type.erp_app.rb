# This migration comes from erp_app (originally 20131102171801)
class AddCustomerRoleType
  
  def self.up
    RoleType.create(description: 'Customer', internal_identifier: 'customer')
  end
  
  def self.down
    RoleType.find_by_internal_identifier('customer').destroy
  end

end
