RailsAdmin.config do |config|

  config.main_app_name = ['AIRLIFT', 'Admin']

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end

  config.model 'User' do
    visible false
  end

  config.actions do
    dashboard
    index
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
