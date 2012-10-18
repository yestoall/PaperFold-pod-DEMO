# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project"
#require "bubble-wrap/all"
require "teacup"
require "sugarcube"
require "sweettea"
require "formotion"
require "geomotion"
require "motion-cocoapods"

Motion::Project::App.setup do |app|
  app.name             = "BAG"
  app.version          = "1.0"
  app.icons            = ["icon", "icon@2"]
  app.prerendered_icon = true
  app.fonts            = ["bag_app"]
  app.pods do
    pod "StyledTableViewCell-for-iOS"
    pod "SVProgressHUD"
    # pod "MPFoldTransition"
  end

  app.vendor_project('vendor/PaperFold', :xcode,
      :target => 'PaperFold',
      :headers_dir => 'PaperFold')  
end
