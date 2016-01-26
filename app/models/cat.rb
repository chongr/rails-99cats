class Cat < ActiveRecord::Base
  COLORS = [
    'grey',
    'black',
    'brown',
    'white',
    'gold',
    'red',
    'platinum',
    'green'
  ]

  validates :birth_date, :name, presence: true
  validates :color, inclusion: COLORS, presence: true
  validates :sex, inclusion: ["M", "F"], presence: true

  def age
    now = Date.today
    now.year - birth_date.year
  end
  
end
