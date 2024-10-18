module RsvpsHelper
    def previous_step
        index = RsvpsController::STEPS.index(@step)

        RsvpsController::STEPS[index - 1]
    end

    def first_step?
        index = RsvpsController::STEPS.index(@step)
        index == 0
    end 
end
