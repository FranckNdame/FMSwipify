#
# Be sure to run `pod lib lint FMSwipify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FMSwipify'
  s.version          = '0.2.4'
  s.summary          = 'A framework that is meant to make your life easier when working with nested Collection Views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A framework that is meant to make your life easier when working with nested Collection Views. The framework also provides a good base for your custom implementations.'

  s.homepage         = 'https://github.com/FranckNdame/FMSwipify'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FranckNdame' => 'franck.mpouli@yahoo.com' }
  s.source           = { :git => 'https://github.com/FranckNdame/FMSwipify.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@breezedoc_in'

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'

  s.source_files = 'FMSwipify/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FMSwipify' => ['FMSwipify/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
