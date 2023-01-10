class ZonesController < ApplicationController
    
    def new 

    end 

    def create 
        if params[:heartrate] != nil 
            @zone_0_top = params[:heartrate].to_i * 0.6
            @zone_1_top = params[:heartrate].to_i * 0.7
            @zone_2_top = params[:heartrate].to_i * 0.8
            @zone_3_top = params[:heartrate].to_i * 0.9
            @zone_4_top = params[:heartrate].to_i 
        end 
    end 

end 