# frozen_string_literal: true

class Front < ApplicationRecord
  belongs_to :card
  has_one_attached :media

  validates :media, blob: { content_type: ['image/jpeg', 'image/png', 'audio/mpeg'] }
end
