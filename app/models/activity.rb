class Activity < ApplicationRecord
  has_drafts
  has_paper_trail on: [:update]
end
