class CatRentalRequest < ActiveRecord::Base
  STATUSES = ['PENDING',
    'APPROVED',
    'DENIED']
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUSES
  validate :overlapping_approved_requests

  belongs_to :cat

  #SQL Escape. Remember little bobby tables

  def overlapping_requests
    CatRentalRequest.where("(start_date BETWEEN '#{self.start_date}' AND '#{self.end_date}' OR
                            end_date BETWEEN '#{self.start_date}' AND '#{self.end_date}') AND
                            cat_id = #{self.cat_id}")
  end

  def overlapping_approved_requests
    if overlapping_requests.any? {|req| req.status == "APPROVED"}
      errors[:status] = "Cat rented during that time period"
    end
  end

  def approve!
    if status == 'PENDING'
      CatRentalRequest.transaction do
        self.status = 'APPROVED'
        self.overlapping_requests.each do |crr|
          crr.deny! unless crr == self
        end
        # overlapping_requests.update_all(status: "DENIED")
        self.save!
      end
    else
      errors[:status] = "Status cannot be changed from current state"
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end


end
