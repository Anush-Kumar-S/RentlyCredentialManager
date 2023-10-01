ActiveAdmin.register Credential do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :login_id, :login_password, :created_by, :updated_by
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :login_id, :login_password, :created_by, :updated_by]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
