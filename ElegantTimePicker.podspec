Pod::Spec.new do |s|
  s.name         = "ElegantTimePicker"
  s.version      = "0.1.0"
  s.summary      = "functionality reduced and UI customized version for iOS UIDatePicker."
  s.description  = <<-DESC
                    ElegantTimePicker is a functionality reduced and UI customized version for iOS UIDatePicker.
                    It only have two columns, hours and minutes. All layout issues are handled automatically.
                   DESC
  s.homepage     = "https://github.com/HuanTeng/ElegantTimePicker"
  s.license      = "MIT"
  s.author             = { "Longyi Li" => "longyi@huantengsmart.com" }
  s.social_media_url   = "http://weibo.com/huantengsmart"
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/HuanTeng/ElegantTimePicker.git", :tag => "0.1.0" }
  s.source_files  = "ElegantTimePicker/*.{h,m}"
  s.public_header_files = "ElegantTimePicker/ElegantTimePicker.h"
  s.resources = "ElegantTimePicker/*.png"
  s.requires_arc = true
end
