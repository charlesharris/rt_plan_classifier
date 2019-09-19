class EquivocalPlan < ApplicationRecord
  belongs_to :canonical_plan
  paginates_per 100
end
