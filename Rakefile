# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project"
#require "bubble-wrap/all"
require "teacup"
require "sugarcube"
require "formotion"
require "geomotion"
require "motion-cocoapods"
#require "ParseModel"

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name             = "BAG"
  app.version          = "1.0"
  app.icons            = ["icon", "icon@2"]
  app.prerendered_icon = true
  app.fonts            = ["bag_app"]

  app.pods do
    pod "StyledTableViewCell-for-iOS"
    pod "SVProgressHUD"
  end

  # app.libs << ["/usr/lib/libz.1.1.3.dyLib", "/usr/lib/libsqlite3.dyLib"]
  # app.vendor_project('vendor/Parse.framework', :static, :products => ['Parse'], :headers_dir => 'Headers')
  # app.frameworks += %w(AudioToolbox CFNetwork SystemConfiguration MobileCoreServices Security QuartzCore)

end
