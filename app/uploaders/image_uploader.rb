# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::ImageOptimizer
  include CarrierWave::MiniMagick

  process :optimize
  process :store_dimensions

  def filename
    @name ||= "#{timestamp}-#{super}" if original_filename.present? && super.present?
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) || model.instance_variable_set(var, Time.now.to_i)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :x_large do
    process resize_to_fit: [3600, 3600]
  end

  version :large, from_version: :x_large do
    process resize_to_fit: [1800, 1800]
  end

  version :medium, from_version: :large do
    process resize_to_fit: [900, 900]
  end

  version :small, from_version: :medium do
    process resize_to_fit: [640, 640]
  end

  version :thumb, from_version: :small do
    process resize_to_fit: [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  private

  def store_dimensions
    if file && model && model.respond_to?(:width) && model.respond_to?(:height) && model.respond_to?(:get_orientation)
      model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
      model.orientation = model.get_orientation
    end
  end
end
