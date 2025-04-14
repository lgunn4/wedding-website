module RsvpsHelper
    def previous_step
        index = Rsvp::STEPS.index(@step)

        Rsvp::STEPS[index - 1]
    end

    def first_step?
        index = Rsvp::STEPS.index(@step)
        index == 0
    end 
end
