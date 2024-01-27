ActiveAdmin.register Credential do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  config.clear_action_items!
  
  permit_params :name, :login_id, :login_password, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :name
      f.input :login_id
      f.input :login_password, as: :string
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :login_id
    column :login_password
    column 'created_by' do |credential|
      User.find_by(id: credential.created_by).email
    end
    column 'updated_by' do |credential|
      User.find_by(id: credential.updated_by).email
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :login_id
      row :login_password
      row 'created_by' do |credential|
        User.find_by(id: credential.created_by).email
      end
      row 'updated_by' do |credential|
        User.find_by(id: credential.updated_by).email
      end
      row :created_at
      row :updated_at
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :login_id, :login_password, :created_by, :updated_by]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
