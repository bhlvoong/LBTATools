#
# Be sure to run `pod lib lint LBTATools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBTATools'
  s.version          = '0.1.8'
  s.summary          = 'Set of tools to drastically improve development speed of UI in iOS applications'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A lot of the applications built for contract and consulting gigs require a ton of heavy lifting in terms of boilerplate code.  For the most part, I do a lot of prototyping and enjoy using a large set of tools that help me avoid a ton of repetitive syntax.  This library is aimed to reduce all the mundane code related to UI development.'

  s.homepage         = 'https://github.com/bhlvoong/LBTATools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Voong' => 'admin@letsbuildthatapp.com' }
  s.source           = { :git => 'https://github.com/bhlvoong/LBTATools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/buildthatapp'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'LBTATools' => ['LBTATools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
