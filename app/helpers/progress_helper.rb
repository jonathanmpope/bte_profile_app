module ProgressHelper 

    def main_graph_data
        total_scores
        strength_scores
        conditioning_scores
        work_capacity_scores
        strength_lower_scores 
        strength_upper_scores
        extended_capacity_scores
        capacity_scores 
        extended_power_scores
        power_scores
    end 

    def total_scores
        @total_scores = Hash.new(0)
        @profiles.each { |profile| @total_scores[profile.created_at.strftime("%b %d, %Y")] = ((profile.strength_score + profile.conditioning_score + profile.work_capacity_score) / 3).round(0)}
    end 

    def strength_scores
        @strength_scores = Hash.new(0)
        @profiles.each { |profile| @strength_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_score.round(0)}
    end 

    def conditioning_scores
        @conditioning_scores = Hash.new(0)
        @profiles.each { |profile| @conditioning_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_score.round(0)}
    end 

    def work_capacity_scores
        @work_capacity_scores = Hash.new(0)
        @profiles.each { |profile| @work_capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.work_capacity_score.round(0)}
    end

    def strength_lower_scores
        @strength_lower_scores = Hash.new(0)
        @profiles.each { |profile| @strength_lower_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_lower_score.round(0)}
    end 

    def strength_upper_scores 
        @strength_upper_scores = Hash.new(0)
        @profiles.each { |profile| @strength_upper_scores[profile.created_at.strftime("%b %d, %Y")] = profile.strength_upper_score.round(0)}
    end 

    def extended_capacity_scores
        @extended_capacity_scores = Hash.new(0) 
        @profiles.each { |profile| @extended_capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_extended_capacity_score.round(0)}
    end 

    def capacity_scores
        @capacity_scores = Hash.new(0)
        @profiles.each { |profile| @capacity_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_capacity_score.round(0)}
    end

    def extended_power_scores
        @extended_power_scores = Hash.new(0)
        @profiles.each { |profile| @extended_power_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_extended_power_score.round(0)}
    end

    def power_scores
        @power_scores = Hash.new(0)
        @profiles.each { |profile| @power_scores[profile.created_at.strftime("%b %d, %Y")] = profile.conditioning_power_score.round(0)}
    end
end 