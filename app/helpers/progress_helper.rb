module ProgressHelper 

    def main_graph_data
        total_scores
        strength_scores
        conditioning_scores
        work_capacity_scores
        strength_lower_scores 
        strength_upper_scores 
    end 

    def total_scores
        @total_scores = Hash.new(0)
        @profiles.each { |profile| @total_scores[profile.created_at] = ((profile.strength_score + profile.conditioning_score + profile.work_capacity_score) / 3).round(0)}
    end 

    def strength_scores
        @strength_scores = Hash.new(0)
        @profiles.each { |profile| @strength_scores[profile.created_at] = profile.strength_score.round(0)}
    end 

    def conditioning_scores
        @conditioning_scores = Hash.new(0)
        @profiles.each { |profile| @conditioning_scores[profile.created_at] = profile.conditioning_score.round(0)}
    end 

    def work_capacity_scores
        @work_capacity_scores = Hash.new(0)
        @profiles.each { |profile| @work_capacity_scores[profile.created_at] = profile.work_capacity_score.round(0)}
    end

    def strength_lower_scores
        @strength_lower_scores = Hash.new(0)
        @profiles.each { |profile| @strength_lower_scores[profile.created_at] = profile.strength_lower_score.round(0)}
    end 

    def strength_upper_scores 
        @strength_upper_scores = Hash.new(0)
        @profiles.each { |profile| @strength_upper_scores[profile.created_at] = profile.strength_upper_score.round(0)}
    end 

end 