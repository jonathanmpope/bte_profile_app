class ThresholdController < ApplicationController

     def show 
     end 

     def create 
        if params[:units] == 'imperial'
            threshold_converter_calc_imperial
        elsif 
            threshold_converter_calc_metric
        end 
     end 

     def threshold_converter_calc_imperial 
        time = params[:minutes].to_i * 60 + params[:seconds].to_i
        @units = 'imperial'
        @threshold_top = time 
        @threshold_bottom = time - 30
        @distance_top = time + 60 
        @distance_bottom = time + 30 
        @repeat_top = time -45 
        @repeat_bottom = time -75 
     end 

     def threshold_converter_calc_imperial 
        time = params[:minutes].to_i * 60 + params[:seconds].to_i
        @units = 'metric'
        @threshold_top = time 
        @threshold_bottom = time - 30
        @distance_top = time + 60 
        @distance_bottom = time + 30 
        @repeat_top = time -45 
        @repeat_bottom = time -75 
     end 

end 