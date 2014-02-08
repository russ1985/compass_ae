# This migration comes from compass_ae_saas (originally 20120606195730)
class AddTrackedStatusTypes
  
  def self.up
    TrackedStatusType.create(:internal_identifier => 'undeployed', :description => 'Undeployed') if TrackedStatusType.find_by_internal_identifier('undeployed').nil?
    TrackedStatusType.create(:internal_identifier => 'deploying', :description => 'Deploying') if TrackedStatusType.find_by_internal_identifier('deploying').nil?
    TrackedStatusType.create(:internal_identifier => 'deployed', :description => 'Deployed') if TrackedStatusType.find_by_internal_identifier('deployed').nil?
  end
  
  def self.down
    TrackedStatusType.find_by_internal_identifier('undeployed').destroy unless TrackedStatusType.find_by_internal_identifier('undeployed').nil?
    TrackedStatusType.find_by_internal_identifier('deploying').destroy unless TrackedStatusType.find_by_internal_identifier('deploying').nil?
    TrackedStatusType.find_by_internal_identifier('deployed').destroy unless TrackedStatusType.find_by_internal_identifier('deployed').nil?
  end

end