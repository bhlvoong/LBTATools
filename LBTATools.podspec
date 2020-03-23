# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBTATools'
  s.version          = '1.0.12'
  s.summary          = 'Set of tools to drastically improve development speed of UI in iOS applications'

  s.description      = 'A lot of the applications built for contract and consulting gigs require a ton of heavy lifting in terms of boilerplate code.  For the most part, I do a lot of prototyping and enjoy using a large set of tools that help me avoid a ton of repetitive syntax.  This library is aimed to reduce all the mundane code related to UI development.'

  s.homepage         = 'https://github.com/bhlvoong/LBTATools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Voong' => 'admin@letsbuildthatapp.com' }
  s.source           = { :git => 'https://github.com/bhlvoong/LBTATools.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/buildthatapp'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
    "ios": "9.0"
  }
  
  # s.resource_bundles = {
  #   'LBTATools' => ['LBTATools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
