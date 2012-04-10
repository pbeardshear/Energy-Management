# -*- coding: utf-8 -*-
if Hall.where(:id => 1).empty?
  Hall.create(:id => 1,:name => "Shofix Hall", :key =>"Bd5238Ki31GOL5ZewrQglA%3D%3D").save()
  GreenFeature.create(:id =>1, :name => "Flourescent Light Bulbs", :content => "This hall has low-wattage light bulbs.")
  HallFeature.create(:hall_id => 1, :green_feature_id => 1)
end

# Adding categories  
Categories = {
  "General" => Category.create(:name => "General"),
  "Office" => Category.create(:name => "Office"),
  "Lab" => Category.create(:name => "Lab"),
  "Residence Halls" => Category.create(:name => "Residence Halls")
}

# Adding tips
Tipz = {
  "Turn Off" => Tip.create(:title => "TURN OFF WHAT YOU'RE NOT USING", 
                           :content => "Monitors and lights when you’re away for more than 15 minutes"),
  "Buy" => Tip.create(:title => "Buy enegry efficient products",
                      :content => "Choose CFL or LED light bulbs instead of incandescents")
}

# Add elements to the join table
CategoryTip.create( "category_id" => Categories["General"].id,
                     "tips_id" => Tipz["Turn Off"].id )
CategoryTip.create( "category_id" => Categories["Office"].id,
                     "tips_id" => Tipz["Buy"].id )
