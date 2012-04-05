if Hall.where(:id => 1).empty?
  Hall.create(:id => 1,:name => "Shofix", :key =>"Bd5238Ki31GOL5ZewrQglA%3D%3D").save()
  GreenFeature.create(:id =>1, :name => "Flourescent Light Bulbs", :content => "This hall has low-wattage light bulbs.")
  HallFeature.create(:hall_id => 1, :green_feature_id => 1)
end
