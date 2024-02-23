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
        @repeat_bottom = time -105 
        @four_hundred_top = time -85
        @four_hundred_bottom = time -105
        @six_hundred_top = time -65
        @six_hundred_bottom = time -85
        @eight_hundred_top = time -45
        @eight_hundred_bottom = time -65
        @one_mile_top = time -45
        @one_mile_bottom = time -60
     end 

     def threshold_converter_calc_metric
        time = (params[:minutes].to_i * 60 + params[:seconds].to_i) 
        @units = 'metric'
        @threshold_top = time 
        @threshold_bottom = time - 18.64113
        @distance_top = time + 37.28226
        @distance_bottom = time + 18.64113
        @repeat_top = time - 27.961695 
        @repeat_bottom = time -65.244
        @four_hundred_top = time -52.816
        @four_hundred_bottom = time -65.244
        @six_hundred_top = time -40.389
        @six_hundred_bottom = time -52.816
        @eight_hundred_top = time -27.961
        @eight_hundred_bottom = time -40.389
        @one_mile_top = time -27.961
        @one_mile_bottom = time -37.282
     end 

end 