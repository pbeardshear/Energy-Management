# -*- coding: utf-8 -*-
if Hall.where(:id => 1).empty?
  Hall.create(:id => 1,:name => "Shofix Hall", :key =>"Bd5238Ki31GOL5ZewrQglA%3D%3D").save()
  GreenFeature.create(:id =>1, :name => "Flourescent Light Bulbs", :content => "This hall has low-wattage light bulbs.")
  HallFeature.create(:hall_id => 1, :green_feature_id => 1)
end

# Adding categories  
#Categories = {
#  "General" => Category.create(:name => "General"),
#  "Office" => Category.create(:name => "Office"),
#  "Lab" => Category.create(:name => "Lab"),
#  "Residence Halls" => Category.create(:name => "Residence Halls")
#}

# Adding tips
#Tipz = {
#  "Turn Off" => Tip.create(:title => "TURN OFF WHAT YOU'RE NOT USING", 
#                           :content => "Monitors and lights when you’re away for more than 15 minutes"),
#  "Buy" => Tip.create(:title => "Buy enegry efficient products",
#                      :content => "Choose CFL or LED light bulbs instead of incandescents")
#}

# Add elements to the join table
#CategoryTip.create( "category_id" => Categories["General"].id,
                  #   "tips_id" => Tipz["Turn Off"].id )
#CategoryTip.create( "category_id" => Categories["Office"].id,
#                     "tips_id" => Tipz["Buy"].id )

Category_general = Category.create(:name=>"General")
Category_office = Category.create(:name=>"Office")
Category_lab = Category.create(:name=>"Lab")
Category_reshall = Category.create(:name=>"Residence Hall")

generalTips = Array[
Tip.create(:title=>"Turn off what you\'re not using", :content=>"Monitors and lights when you\'re away for more than 15 minutes"),
Tip.create(:title=>"Turn off what you\'re not using", :content=>"Overhead lights when not needed, including in common areas"),
Tip.create(:title=>"Turn off what you\'re not using", :content=>"Individual printers and other equipment at night and on weekends"),

Tip.create(:title=>"Buy energy efficient products", :content=>"Make sure your new computer, appliance, and electronics purchase are ENERGY STAR compliant"),
Tip.create(:title=>"Buy energy efficient products", :content=>"Choose CFL or LED light bulbs instead of incandescents"),

Tip.create(:title=>"Reduce the energy used by your computer", :content=>"Enable the energy-saving features like sleep mode"),
Tip.create(:title=>"Reduce the energy used by your computer", :content=>"Avoid screensavers, they cause newer monitors to use more energy"),
Tip.create(:title=>"Reduce the energy used by your computer", :content=>"Reduce the brightness and bump up the contrast of your monitor")
]

generalTips.each do |tip|
  CategoryTip.create(:category_id=>Category_general.id, :tip_id=>tip.id)
end


officeTips = Array[
Tip.create(:title=>"Purchasing", :content=>"<h3>Buy Energy Efficient Equipment</h3>Look for Energy Star or EPEAT equipment when shopping BearBuy or see if the Environmentally Preferred list includes an option for the equipment you want to buy."),
Tip.create(:title=>"Purchasing", :content=>"<h3>Choose a Laptop Instead of Desktop</h3>Laptops can save up to 90% in electricity use compared to desktop models."),
Tip.create(:title=>"Purchasing", :content=>"<h3>Upgrade CRT Monitors to LCDs</h3>Save energy by buying a flat screen monitor for your desktop. An LCD monitor uses about 40% less power than a CRT."),
Tip.create(:title=>"Purchasing", :content=>"<h3>Replace Old Refrigerators</h3>New refrigerators on average use about half the energy of models from 1990. Use common area refrigerators and microwaves instead of personal ones."),

Tip.create(:title=>"Standby Power", :content=>"<h3>Unplug</h3> Simply unplug items that you dont use very often."),
Tip.create(:title=>"Standby Power", :content=>"<h3>Use a Power Strip</h3>Plug in items like chargers and lamps, make the strip easily accessible, and turn it off when those items arent being used."),
Tip.create(:title=>"Standby Power", :content=>"<h3>Check Out a Kill-a-Watt</h3>If you want to know how much energy an electronic item is wasting when not in use, borrow a Kill-a-Watt monitor from the Office of Sustainability. Email myPower@berkeley.edu to reserve one today."),

Tip.create(:title=>"Thermal Comfort", :content=>"<h3>Close Doors and Windows When the Heat or AC is On</h3>Also check for drafts and air leaks and report problems to your building manager."),
Tip.create(:title=>"Thermal Comfort", :content=>"<h3>Use Sunlight Wisely</h3>Block direct sunlight by closing or tilting blinds to reduce cooling needs during the summer. In colder weather, leave shades and blinds open on sunny days, but close them at night to help reduce heat loss through windows."),
Tip.create(:title=>"Thermal Comfort", :content=>"<h3>Avoid Using Space Heaters</h3>Portable heaters can be unsafe and use large amounts of energy. Wear extra layers instead. If the building temperature is not in an acceptable range and youre still cold, look into purchasing an efficient and safe radiant heater. The Department of Energy has some helpful guidelines."),

Tip.create(:title=>"Lighting", :content=>"<h3>Turn Off Lights When You Dont Need Them</h3>Look to eliminate unnecessary lights and use natural lighting when possible."),
Tip.create(:title=>"Lighting", :content=>"<h3>Use Task Lighting</h3>If possible, turn off overhead lights and switch on a desk lamp. With low-wattage task lighting, less ambient light is needed, resulting in energy savings upwards of 40%."),
Tip.create(:title=>"Lighting", :content=>"<h3>Switch to CFL or LED Light Bulbs</h3>CFLs last 6 to 12 times longer than incandescents and use about 75% less energy. Light-emitting diode (LED) bulbs last even longer than CFLs and use a fraction of the energy. Both are available in equivalent light intensity and quality."),
Tip.create(:title=>"Lighting", :content=>"<h3>Agree on Lighting Routines in Communal Spaces</h3>Work with other building occupants on a routine for turning lights off when they are not needed. Post instructions for more complex switches. Install lighting timers or occupancy sensors in common areas whenever possible."),

Tip.create(:title=>"Computers", :content=>"Turn off your monitor when you leave for more than 15 minutes."),
Tip.create(:title=>"Computers", :content=>"Turn off individual printers at night and on weekends."),
Tip.create(:title=>"Computers", :content=>"<h3>Avoid Screensavers</h3>Originally used to prevent images from being burned into older monitors, they actually cause newer ones to use more energy by preventing them from going to sleep."),
Tip.create(:title=>"Computers", :content=>"<h3>Reduce Brightness and Bump Up Contrast</h3>Dropping brightness to the lowest setting can reduce power usage by up to 50 percent, just make sure that you can still easily read the screen by boosting contrast! It can also help to choose a desktop background that is darker."),
Tip.create(:title=>"Computers", :content=>"<h3>Disable Bluetooth and AirPort</h3>Save battery power by turning off the wireless Bluetooth and AirPort when not in use and make sure to fully charge and fully discharge your laptop battery once a month."),
Tip.create(:title=>"Computers", :content=>"<h3>Enable Energy-Saving Features</h3> Make sure the Energy Star or EPEAT features are turned on. Ask IT staff if you dont know."),
Tip.create(:title=>"Computers", :content=>"<h3>Keep Vents on Your Computer Clean and Unblocked</h3>This keeps the fans that cool your machine working more efficiently and can extend the life of your computer."),
Tip.create(:title=>"Computers", :content=>"<h3>Take Advantage of the Power of Your Network</h3>Many printers and multi-functional devices (combining copying, printing, and scanning functions) are easy to network together so multiple people can use them."),
Tip.create(:title=>"Computers", :content=>"<h3>Ask IT Staff</h3>See if backups and updates could be regularly done on the same day of the week, so that computers could be turned off the other days."),
Tip.create(:title=>"Computers", :content=>"<h3>Virtualize Your Servers</h3>Consider moving your servers to the campus data center, which can reduce the total amount of energy used through virtualization and other actions. Click here for more information.")
]

officeTips.each do |tip|
  CategoryTip.create(:category_id=>Category_office.id, :tip_id=>tip.id)
end

labTips = Array[
Tip.create(:title=>"Cold Storage", :content=>"Minimize Frost Formation on Freezers"),
Tip.create(:title=>"Cold Storage", :content=>"Clean Refrigerator & Freezer Coils"),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Check the Door Seals or Gaskets for Leaks</h3>Do this by puttling a dollar bill in the door as you close it and see if holds firmly in place."),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Keep a Cleared Radius of 3</h3>Reduce the heat load by keeping items off and away from appliances."),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Locate Freezers in Cooler Areas</h3>Freezers have to work hard to maintain cold temperatures if the surrounding air is hot."),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Consider Using Chest Freezers</h3>Chest freezers are more energy efficient than upright freezers."),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Turn Off Any Empty Freezers</h3>"),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Consider Alternate Storage Methods</h3>Switching to new room temperature sample storage methods (e.g., biomatrica.com) or liquid nitrogen storage tanks for certain kinds of samples can reduce electricity use as well as increase storage dependability. Contact myPower@berkeley.edu for more information and case studies."),
Tip.create(:title=>"Cold Storage", :content=>"<h3>Conduct an Equipment Audit</h3>Identify items that can be decommissioned, not only cold storage, but other equipment as well. You can save electricity by not having excess equipment plugged in, and free up space in your lab. You can also request (myPower@berkeley.edu)stickers to help signal which equipment can be regularly turned off."),
Tip.create(:title=>"Fume Hoods", :content=>"<h3>Shut Fume Hood Sashes</h3>When not in use, decrease hood work opening. When working with chemicals, set the sash at the proper opening and never more than is recommended."),
Tip.create(:title=>"Fume Hoods", :content=>"<h3>Store Chemicals and Equipment in Cabinets</h3>Keep fume hoods clear of unnecessary items that can block ventilation."),
Tip.create(:title=>"Fume Hoods", :content=>"<h3>Report Excessively High Inflows</h3>If your fume hood has >150 ft/min inflow, turbulence and decreased containment can occur."),
Tip.create(:title=>"Fume Hoods", :content=>"<h3>Turn Off BioSafety Cabinets</h3>Shut sashes and turn off blowers and lights at night."),
Tip.create(:title=>"Fume Hoods", :content=>"<h3>Collaborate with Your Facility Manager</h3>Explore the possibilities of installing occupancy sensors to turn off fume hoods at night. Such occupancy-based measures might work best for teaching labs, but could decrease energy use overall. Also ask about decommissioning hoods, switching to more efficient variable air volume fume hoods, or changing the temperature operating range of the lab space."),

Tip.create(:title=>"Lighting", :content=>"<h3>Turn Off Lights When You Dont Need Them</h3>Look to eliminate unnecessary lights and use natural lighting when possible."),
Tip.create(:title=>"Lighting", :content=>"<h3>Use Task Lighting</h3>If possible, turn off overhead lights and switch on a desk lamp. With low wattage task lighting, less ambient light is needed, resulting in energy savings upwards of 40%."),
Tip.create(:title=>"Lighting", :content=>"<h3>Switch to CFL or LED Light Bulbs</h3>CFLs last 6–12 times longer than incandescents and use about 75% less energy. Light-emitting diode (LED) bulbs last even longer than CFLs and use a fraction of the energy. Both are available in equivalent light intensity and quality."),
Tip.create(:title=>"Lighting", :content=>"<h3>Agree on Lighting Routines in Communal Spaces</h3>Work with other building occupants on a routine for turning lights off when they are not needed. Post instructions for more complex switches. Install lighting timers or occupancy sensors in common areas whenever possible."),

Tip.create(:title=>"Stand By", :content=>"<h3>Use a Power Strip</h3>Plug in items like chargers and lamps, make the strip easily accessible and turn it off when those items arent being used."),
Tip.create(:title=>"Stand By", :content=>"<h3>Check Out a Kill-a-Watt</h3>If you want to know how much energy an electronic item is wasting when not in use, borrow a KillaWatt monitor from the Office of Sustainability. Email myPower@berkeley.edu to reserve one today."),

Tip.create(:title=>"Purchasing", :content=>"<h3>Buy Energy Efficient Equipment </h3>Look for Energy Star or EPEAT equipment when shopping BearBuy or see if the Environmentally Preferred list includes an option for the equipment you want to buy."),
Tip.create(:title=>"Purchasing", :content=>"<h3>Ask the Vendor</h3>If youre buying a specialty item like a lab freezer and theres not an Energy Star alternative, ask the vendor for information on energy usage and how to adjust energy-saving settings. Also checkout the Labs21 energy saving equipment wiki.")
]

labTips.each do |tip|
  CategoryTip.create(:category_id=>Category_lab.id, :tip_id=>tip.id)
end