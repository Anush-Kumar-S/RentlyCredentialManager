ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :employee_code, :phone, :role, :email, :password


  index do
    selectable_column
    id_column
    column :name
    column :employee_code
    column :phone
    column :email
    column 'role' do |user|
      user.role == 1 ? 'Admin' : 'Viewer'
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :employee_code
      row :phone
      row :email
      row 'role' do |user|
        user.role == 1 ? 'Admin' : 'Viewer'
      end
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :employee_code
      f.input :phone
      f.input :email
      f.input :role, as: :select, collection: { 'Admin' => 1, 'Viewer' => 0 }
      f.input :password if f.object.new_record?
    end
  f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :employee_code, :phone, :role, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
