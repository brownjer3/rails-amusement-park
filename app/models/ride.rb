class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if valid_tickets? && valid_height?
            user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
            "Thanks for riding the #{self.attraction.name}!"
        elsif !valid_tickets? && !valid_height?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !valid_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !valid_height?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        end
    end

    def valid_tickets?
        user.tickets >= attraction.tickets
    end

    def valid_height?
        user.height >= attraction.min_height
    end
end
