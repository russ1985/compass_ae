# This migration comes from compass_ae_saas (originally 20110728201740)
class CreateDesktopAppSaasManager
  def self.up
    app = DesktopApplication.create(
      :description => 'SaaS Manager',
      :icon => 'icon-apartment',
      :javascript_class_name => 'Compass.ErpApp.Desktop.Applications.SaasManager',
      :internal_identifier => 'saas_manager',
      :shortcut_id => 'saas_manager-win'
    )
    
    desktop_shortcut = PreferenceType.iid('desktop_shortcut')
    desktop_shortcut.preferenced_records << app
    desktop_shortcut.save
    
    autoload_application = PreferenceType.iid('autoload_application')
    autoload_application.preferenced_records << app
    autoload_application.save

    app.save
  end

  def self.down
    DesktopApplication.destroy_all("internal_identifier = 'saas_manager'")
  end
end
