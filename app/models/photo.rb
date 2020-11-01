class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validate :picture_size if -> { image.attached? }

  def picture_size
    # https://stackoverflow.com/a/48176339/432880
    if image.blob.byte_size > 5.megabytes
      errors.add(:image, 'too large!')
    end
  end
end
