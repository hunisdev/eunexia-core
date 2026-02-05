class RawEvent < ApplicationRecord
  belongs_to :integration
  belongs_to :inbound_run
end
