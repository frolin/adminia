class Project < ApplicationRecord
  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: "320x230"
  end
end
