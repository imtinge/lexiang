class Game < ApplicationRecord
  mount_uploader :picture, PictureUploader
  acts_as_taggable
  validates :title, presence: { message: '名称不能为空' }
end
