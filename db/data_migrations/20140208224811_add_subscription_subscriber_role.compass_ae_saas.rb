# This migration comes from compass_ae_saas (originally 20140206165823)
class AddSubscriptionSubscriberRole

  def self.up
    RoleType.create(description: 'Subscription Subscriber', internal_identifier: 'subscription_subscriber')
  end

  def self.down
    RoleType.iid('subscription_subscriber').destroy
  end

end
