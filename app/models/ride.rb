class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def more_tickets
    if self.user.tickets < self.attraction.tickets
      "You do not have enough tickets to ride the #{self.attraction.name}."
    end
  end

  def more_height
    if self.user.height < self.attraction.min_height
      "You are not tall enough to ride the #{self.attraction.name}."
    end
  end


  def take_ride
    if !more_tickets && !more_height
      update_happy_nausea_tickets
      "Thanks for riding the #{self.attraction.name}!"
    else
      if !!more_tickets && !!more_height
        "Sorry. #{more_tickets} #{more_height}"
      elsif !!more_tickets
        "Sorry. #{more_tickets}"
      else
        "Sorry. #{more_height}"
      end
    end
  end


  def update_happy_nausea_tickets
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end

end
