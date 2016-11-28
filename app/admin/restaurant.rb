ActiveAdmin.register Restaurant do
  permit_params do
    permitted = %i(name start_date end_date start_time end_time description
                   main_image main_image_cache position visible slug address
                   music atmosphere style)
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
    column :description
    column :visible
    actions
  end

  filter :name
  filter :description
  filter :created_at
  filter :updated_at
  filter :visible

  form partial: '/admin/restaurants/form'

  show do |restaurant|
    panel I18n.t('admin.restaurant.details') do
      attributes_table_for restaurant do
        rows :name, :address, :visible, :position, :start_date, :end_date
        row(:start_time) { restaurant.start_time.strftime('%l:%M:%S %p') }
        row(:end_time) { restaurant.end_time.strftime('%l:%M:%S %p') }
        row(:main_image) do |restaurant|
          restaurant.try(:main_image) ? image_tag(restaurant.try(:main_image), height: '100px') : '-'
        end
        row(:description)
        rows :music, :atmosphere, :style, :created_at, :updated_at
      end
    end

    panel t('admin.restaurant.images') do
      attributes_table_for restaurant do
        row(:images) do |restaurant|
          content_tag(:ul, class: 'admin-dynamicImages') do
            restaurant.images.by_position.each do |image|
              img = image_tag(image.file.thumb, height: '100px')
              adm_img = admin_images_path(scope: 'restaurants', attachable_id: restaurant.id)
              concat content_tag(:li, link_to(img, adm_img))
            end
          end
        end
      end
    end

    panel t('admin.restaurant.videos') do
      attributes_table_for restaurant do
        row(:videos) do |restaurant|
          content_tag(:ul, class: 'admin-dynamicImages') do
            restaurant.videos.by_latest.each do |image|
              concat content_tag(:li, image_tag(image.thumbnail_medium, height: '100px'))
            end
          end
        end
      end
    end

    panel t('seo_details') do
      attributes_table_for restaurant.seo_detail do
        row(:meta_title) { |seo_detail| seo_detail.try(:meta_title) ? seo_detail.meta_title : '-' }
        row(:meta_description) { |seo_detail| seo_detail.try(:meta_description) ? seo_detail.meta_description : '-' }
        row(:meta_url) { |seo_detail| seo_detail.try(:meta_url) ? seo_detail.meta_url : '-' }
      end
    end
  end
end
