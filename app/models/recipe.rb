class Recipe < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  has_many :ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, :image, :ingredients, :directions, presence: true
end
