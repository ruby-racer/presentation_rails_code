ActiveAdmin.register RestaurantEnquiry do
  menu parent: I18n.t('admin.navigation.booking_enquiries')

  permit_params :restaurant_id, :user_id, :date, :time, :number_of_guests, :message

  index do
    column(:restaurant) { |restaurant_enquiry| link_to(restaurant_enquiry.restaurant.name, [:admin, restaurant_enquiry.restaurant]) }
    column(:user) { |restaurant_enquiry| link_to(restaurant_enquiry.user.full_name, [:admin, restaurant_enquiry.user]) }
    column :date
    column(:time) { |restaurant_enquiry| restaurant_enquiry.time.strftime('%l:%M:%S %p') }
    column :number_of_guests
    actions
  end

  show do |restaurant|
    attributes_table do
      row :restaurant
      row :user
      row :date
      row(:time) { restaurant.time.strftime('%l:%M:%S %p') }
      row :number_of_guests
      row :message
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :user, include_blank: false
      f.input :restaurant, include_blank: false
      f.input :date, as: :datepicker
      f.input :time
      f.input :number_of_guests
      f.input :message
    end

    f.actions
  end

  sidebar I18n.t('admin.common_timestamps_sidebar'), only: :show do
    attributes_table_for resource do
      row :created_at
      row :updated_at
    end
  end
end
