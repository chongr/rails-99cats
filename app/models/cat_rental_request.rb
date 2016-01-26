class CatRentalRequest < ActiveRecord::Base
  STATUSES = ['PENDING',
    'APPROVED',
    'DENIED']
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUSES
  #validate :overlapping_approved_requests

  def overlapping_requests
    CatRentalRequest.where('(start_date BETWEEN #{self.start_date} AND #{self.end_date} OR
                            end_date BETWEEN #{self.start_date} AND #{self.end_date}) AND
                            cat_id = #{self.cat_id}')
  end

end