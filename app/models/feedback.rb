 class Feedback < ActiveRecord::Base

  validates :subject, :presence => true
  validates :comment, :presence => true
end