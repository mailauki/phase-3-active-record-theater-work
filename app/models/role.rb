class Role < ActiveRecord::Base
  has_many :auditions
  has_many :actors, through: :auditions
  has_many :locations, through: :auditions

  def lead
    is_hired = self.where(hired: true)
    is_hired ? is_hired.first : 'no actor has been hired for this role'
  end

  def understudy
    is_hired = self.where(hired: true)
    is_hired ? is_hired.second : 'no actor has been hired for understudy for this role'
  end
end