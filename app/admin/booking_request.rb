ActiveAdmin.register BookingRequest, as: 'BookingEnquiry' do
  menu parent: I18n.t('admin.navigation.booking_enquiries')

  actions :all, except: [:new, :create, :edit, :update, :destroy]

  index do
    column(:enquiry_type) do |booking_enquiry|
      link_to(booking_enquiry.bookable.class.name.underscore.humanize, [:admin, booking_enquiry.bookable])
    end
    column(:created) do |booking_enquiry|
      l(booking_enquiry.created_at)
    end
  end

  filter :created_at
end
