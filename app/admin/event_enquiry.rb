ActiveAdmin.register EventEnquiry do
  menu parent: I18n.t('admin.navigation.booking_enquiries')

  permit_params :event_id, :user_id, :date, :time, :number_of_guests, :message

  index do
    column(:event) { |event_enquiry| link_to(event_enquiry.event.name, [:admin, event_enquiry.event]) }
    column(:user) { |event_enquiry| link_to(event_enquiry.user.full_name, [:admin, event_enquiry.user]) }
    column :date
    column(:time) { |event_enquiry| event_enquiry.time.strftime('%l:%M:%S %p') }
    column :number_of_guests
    actions
  end

  show do |event|
    attributes_table do
      row :event
      row :user
      row :date
      row(:time) { event.time.strftime('%l:%M:%S %p') }
      row :number_of_guests
      row :message
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :user, include_blank: false
      f.input :event, include_blank: false
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
