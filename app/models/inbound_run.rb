class InboundRun < ApplicationRecord
  belongs_to :integration
  has_many :inbound_attempts, dependent: :destroy

  STATUSES = %w[pending running completed failed].freeze
  MODES = %w[polling webhook].freeze

  validates :status, inclusion: { in: STATUSES }
  validates :mode, inclusion: { in: MODES }
  validates :correlation_id, presence: true, uniqueness: true
end
