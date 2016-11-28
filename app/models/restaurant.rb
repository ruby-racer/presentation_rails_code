class Restaurant < ActiveRecord::Base
  include Concerns::ActsAsCacheable
  include Concerns::ActsAsInvisible
  include Concerns::ActsAsListable
  include Concerns::ActsAsSeoable

  acts_as_list add_new_at: :bottom

  has_many :enquiries, class_name: 'RestaurantEnquiry'
  has_many :images, as: :attachable, dependent: :destroy
  has_many :videos, as: :attachable, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :main_image, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  mount_uploader :main_image, ImageUploader

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :videos, allow_destroy: true
end
