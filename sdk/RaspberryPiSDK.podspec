Pod::Spec.new do |s|
  s.name         = "RaspberryPiSDK"
  s.version      = "0.0.1"
  s.summary      = "An SDK to talk to Raspberry Pi via iOS device"
  s.homepage     = "https://github.com/jjalan/RaspberryPiSDK"
  s..license     = 'MIT'
  s.author       = { "Jaikishan Jalan" => "jai.ism@gmail.com" }
  s.source       = { :git => "https://github.com/jjalan/RaspberryPiSDK.git", :tag => s.version.to_s }
  s.ios.deployment_target  = '5.0'
  s.osx.deployment_target  = '10.7'
  s.source_files  = "sdk/RaspberryPiSDK", "sdk/RaspberryPiSDK/**/*.{h,m}"
  s.exclude_files = "sdk/RaspberryPiSDK/Exclude"
  s.public_header_files = "sdk/RaspberryPiSDK/**/*.h"
  s.requires_arc = true
  s.dependency "NMSSH"

end
