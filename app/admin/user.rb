ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :tel, :password, :password_confirmation, :approved

  index do
    id_column
    column(:first_name)
    column(:last_name)
    column(:email)
    column(:tel)
    column(:approved)
    actions
  end

  filter :last_name
  filter :email

  form do |f|
    f.inputs t('admin.users.details') do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :tel
      f.input :password
      f.input :password_confirmation
      f.input :approved
    end
    f.actions
  end

  show do |user|
    panel t('admin.users.details') do
      attributes_table_for user do
        bool_row(:approved)
        rows :first_name, :last_name, :email
        rows :tel
        rows :created_at, :updated_at
      end
    end
  end

  collection_action :autocomplete_user_name, method: :get

  controller do
    autocomplete :user, :last_name, full: true

    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end
end
