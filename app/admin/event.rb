ActiveAdmin.register Event do
  permit_params do
    permitted = %i(name start_date end_date description main_image main_image_cache
                   position start_time end_time atmosphere music style visible slug address)
    permitted += [images_attributes: Image.permitted_attribute_names]
    permitted += [seo_detail_attributes: SeoDetail.permitted_attribute_names]
    permitted += [videos_attributes: Video.permitted_attribute_names]
    permitted
  end

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  index do
    sortable_handle_column
    id_column
    column :name
    column :start_date
    column :end_date
    column :description
    column :visible
    column :atmosphere
    column :music
    column :style
    actions
  end

  filter :name
  filter :description
  filter :created_at
  filter :updated_at
  filter :visible

  form partial: '/admin/events/form'

  show do |event|
    panel I18n.t('admin.event.details') do
      attributes_table_for event do
        rows :name, :address, :visible, :position, :start_date, :end_date
        row(:start_time) { event.start_time.strftime('%Y/%m/%d %l:%M:%S %p') }
        row(:end_time) { event.end_time.strftime('%l:%M:%S %p') }
        row(:main_image) { |event| event.try(:main_image) ? image_tag(event.try(:main_image), height: '100px') : '-' }
        row(:description)
        rows :music, :atmosphere, :style, :created_at, :updated_at
      end
    end

    panel t('admin.event.images') do
      attributes_table_for event do
        row(:images) do |event|
          content_tag(:ul, class: 'admin-dynamicImages') do
            event.images.by_position.each do |image|
              img = image_tag(image.file.thumb, height: '100px')
              concat content_tag(:li, link_to(img, admin_images_path(scope: 'event', attachable_id: event.id)))
            end
          end
        end
      end
    end

    panel t('admin.event.videos') do
      attributes_table_for event do
        row(:videos) do |event|
          content_tag(:ul, class: 'admin-dynamicImages') do
            event.videos.by_latest.each do |image|
              concat content_tag(:li, image_tag(image.thumbnail_medium, height: '100px'))
            end
          end
        end
      end
    end

    panel t('seo_details') do
      attributes_table_for event.seo_detail do
        row(:meta_title) { |seo_detail| seo_detail.try(:meta_title) ? seo_detail.meta_title : '-' }
        row(:meta_description) { |seo_detail| seo_detail.try(:meta_description) ? seo_detail.meta_description : '-' }
        row(:meta_url) { |seo_detail| seo_detail.try(:meta_url) ? seo_detail.meta_url : '-' }
      end
    end
  end
end
