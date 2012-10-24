Pod::Spec.new do |s|
  s.name         = "PaperFold-pod"
  s.version      = "0.1"
  s.summary      = "PaperFold cocoapod."
  s.homepage     = "https://github.com/yestoall/PaperFold-pod"
  s.license  	 = "BSD"
  s.author       = { "nacho rapallo" => "nacho@yestoall.com" }
  s.source       = { :git => "https://github.com/yestoall/PaperFold-pod.git", :tag => "0.1" }
  s.platform     = :ios
  s.requires_arc = true
  s.source_files = "*.{h,m}"
end