# This migration comes from compass_ae_saas (originally 20130327190805)
class AddSaasSubscriptions

  def self.up
    allowed_logins = ConfigurationItemType.create(internal_identifier: 'allowed_logins',
                                                  description: 'Allowed Logins',
                                                  allow_user_defined_options: true)

    [
        {description: 'Free', amount: 0, logins: 1},
        {description: 'Basic', amount: 99.99, logins: 5},
        {description: 'Pro', amount: 199.99, logins: 25}
    ].each do |plan|
      description = plan[:description]
      internal_identifier = plan[:description].downcase

      subscription_plan = SubscriptionPlan.new
      subscription_plan.description = description
      subscription_plan.internal_identifier = internal_identifier
      subscription_plan.external_identifier = internal_identifier
      subscription_plan.external_id_source = 'stripe'
      subscription_plan.save

      configuration = Configuration.create(internal_identifier: "#{internal_identifier}_subscription_configuration",
                                           description: "#{description} Subscription Configuration",
                                           is_template: false)

      configuration.item_types << allowed_logins
      configuration.save

      configuration.add_item('allowed_logins', plan[:logins])

      subscription_plan.configurations << configuration
      subscription_plan.save

      pricing_plan = PricingPlan.new
      pricing_plan.description = "#{description} Pricing Plan"
      pricing_plan.internal_identifier = "#{internal_identifier}_pricing_plan"
      pricing_plan.is_simple_amount = true
      pricing_plan.money_amount = plan[:amount]
      pricing_plan.save

      subscription_plan.pricing_plans << pricing_plan
      subscription_plan.save
    end

    #create BizTxnAcctPtyRtype for subscription
    role_type = BizTxnAcctPtyRtype.new
    role_type.internal_identifier = 'subscription_owner'
    role_type.description = 'Subscription Owner'
    role_type.save
  end

  def self.down
    ['free', 'basic', 'pro'].each do |plan_iid|
      config = Configuration.find_by_internal_identifier("#{plan_iid}_subscription_configuration")
      config.destory

      type = SubscriptionPlan.find_by_internal_identifier(plan_iid)
      type.destroy

      plan = PricingPlan.find_by_internal_identifier("#{plan_iid}_plan")
      plan.destroy
    end

    ConfigurationItemType.find_by_internal_identifier('allowed_logins').destroy
    BizTxnAcctPtyRtype.iid('subscription_owner').destroy
  end

end
