class Integration < ApplicationRecord
  has_many :inbound_runs, dependent: :destroy
  has_many :raw_events, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, :source_system, presence: true
end
