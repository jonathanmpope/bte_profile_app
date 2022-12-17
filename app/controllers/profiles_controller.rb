class ProfilesController < ApplicationController
    before_action :require_logged_in
    include SofProfileHelper

    def new 
        if params[:commit] != nil  
            @track = params[:track]
        end 
    end 

    def create 
        if params[:units] == 'metric'
            bodyweight = params[:body_weight].to_f * 2.20462
        else  
            bodyweight = params[:body_weight].to_f
        end 
        profile = @user.profiles.create!(weight: bodyweight, track: params[:profile], strength_lower_score: 0, strength_upper_score: 0, strength_score: 0, conditioning_extended_capacity_score: 0, conditioning_capacity_score: 0, conditioning_extended_power_score: 0, conditioning_power_score: 0, conditioning_score: 0, work_capacity_score: 0, unit_type: params[:units])
        if params[:profile] == "sof_land_cont"
            sof_land_contract_profile_calc_starter_method(profile)
        elsif params[:profile] == "sof_mar_cont"
            sof_maritime_contract_profile_calc_starter_method(profile)
        elsif params[:profile] == "sof_land_prep"
            sof_land_prep_profile_calc_starter_method(profile)
        elsif params[:profile] == "operator_short"
           operator_short_profile_calc_starter_method(profile)
        elsif params[:profile] == "operator_long"
           operator_long_profile_calc_starter_method(profile)
        elsif params[:profile] == "hrt"
           hrt_profile_calc_starter_method(profile)
        else 
            sof_maritime_prep_profile_calc_starter_method(profile)
        end 
        redirect_to '/results'
    end 

    private
    def require_logged_in
        if !current_user
            flash[:error] = "Sorry, you must logged in" 
            redirect_to "/"
        end 
    end
end 