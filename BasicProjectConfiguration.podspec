#
#  Be sure to run `pod spec lint BasicProjectConfiguration.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "BasicProjectConfiguration"
  spec.version      = "0.0.1"
  spec.summary      = "Constant, extension"
  spec.description  = "Constant, extension,The custom"
  spec.homepage     = "https://github.com/AdvanceKnowledge/BasicProjectConfiguration"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "wangyanlei" => "920048449@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/AdvanceKnowledge/BasicProjectConfiguration.git", :tag => "0.0.1" }
  spec.source_files = "BasicProjectConfiguration/BasicProjectConfiguration/Lib/**/*.swift"
end
