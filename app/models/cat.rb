class Cat < ActiveRecord::Base
  COLORS = [
    'black',
    'platinum',
    'green'
  ]

  validates :birth_date, :name, presence: true
  validates :color, inclusion: COLORS, presence: true
  validates :sex, inclusion: ["M", "F"], presence: true

  has_many :cat_rental_requests,
  dependent: :destroy

  def age
    now = Date.today
    now.year - birth_date.year
  end

end
