# -*- coding: utf-8 -*-
if Hall.where(:id => 1).empty?
  Hall.create(:id => 1,:name => "Shofix Hall", :key =>"Bd5238Ki31GOL5ZewrQglA%3D%3D").save()
  GreenFeature.create(:id =>1, :name => "Flourescent Light Bulbs", :content => "This hall has low-wattage light bulbs.")
  HallFeature.create(:hall_id => 1, :green_feature_id => 1)
end

# Adding categories  
general_cat = Category.create(:name => "General")
Category.create(:name => "Office")
Category.create(:name => "Lab")
Category.create(:name => "Residence Halls")

# Adding a test Tip, change replace this with actual data later
Tip.create(:title => "TURN OFF WHAT YOU'RE NOT USING",
           :content => "Monitors and lights when you’re away for more than 15 minutes",
           :category_id => general_cat.id )
Tip.create(:title => "BUY ENERGY EFFICIENT PRODUCTS",
           :content => "Choose CFL or LED light bulbs instead of incandescents",
           :category_id => general_cat.id )
