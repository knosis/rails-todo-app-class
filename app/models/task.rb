class Task < ActiveRecord::Base

  validates :description, length: { in: 2..140 }

  def complete?
    self.completed == true
  end

  def complete!
    update! completed: true
  end

  def uncomplete!
    update! completed: false
  end

end
