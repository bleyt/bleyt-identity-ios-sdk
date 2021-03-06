#
# Be sure to run `pod lib lint BleytIdentity.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BleytIdentity'
  s.version          = '0.1.1'
  s.summary          = 'BleytIdentity is the iOS SDK for Bleyt Identity; the only digit passport that you will ever need.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is the Bleyt Identity iOS SDK. With Bleyt, your customers are just one click away from sharing all needed data with you. No form is required; specify the information you require, and we will do the rest for you.
                       DESC

  s.homepage         = 'https://github.com/bleyt/bleyt-identity-ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'koyinusa@gmail.com' => 'kenny@bleyt.com' }
  s.source           = { :git => 'https://github.com/bleyt/bleyt-identity-ios-sdk.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ribads'
  s.swift_versions   = '5.0'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'BleytIdentity' => ['BleytIdentity/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
