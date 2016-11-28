ActiveAdmin.register Image do
  permit_params do
    permitted = %i(attachable_id attachable_type attachable_boat attachable_villa alt_text file position)
  end

  filter :alt_text
  filter :created_at
  filter :updated_at

  scope :all
  scope :boats
  scope :villas

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  index do
    sortable_handle_column
    id_column
    column :file do |image|
      image_tag(image.file.thumb, height: '100px')
    end
    column :attachable
    column :alt_text
    column :created_at
    actions
  end

  show do
    link_to image_tag(image.file.small), image.file.url, target: 'blank', alt: image.alt_text
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :attachable_boat, collection: Boat.all
      f.input :attachable_villa, collection: Villa.all
      f.input :alt_text
      f.input :position
      f.input :file, as: :file, hint: f.object.file.presence ? image_tag(f.object.file.thumb.url).html_safe : ''
      f.input :file_cache, as: :hidden
    end
    f.actions
  end

  sidebar :details, only: :show do
    attributes_table_for resource do
      row :attachable
      row :alt_text
      row :position
    end
  end

  sidebar I18n.t('admin.common_timestamps_sidebar'), only: :show do
    attributes_table_for resource do
      row :created_at
      row :updated_at
    end
  end

  controller do
    def index
      if params[:attachable_id]
        @images = collection.where(attachable_id: params[:attachable_id])
      end
      index!
    end
  end
end
