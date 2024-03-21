#
# Be sure to run `pod lib lint AFExtensionLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AFExtensionLib'
  s.version          = '1.0.2'
  s.summary          = '一个简单的扩展 bundle更新'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  一个简单的扩展一个简单的扩展一个简单的扩展一个简单的扩展一个简单的扩展一个简单的扩展
                       DESC

  s.homepage         = 'https://github.com/Aliffter/AFExtensionLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leo' => 'zhaolongxiao1991@163.com' }
  s.source           = { :git => 'https://github.com/Aliffter/AFExtensionLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  #指定swift版本，否则本地库校验时：pod lib lint，可能会有警告，
  s.swift_version = '5.0'
#  s.swift_versions = ['5.0']

  s.source_files = 'AFExtensionLib/Classes/**/*'
  
   s.resource_bundles = {
     'AFExtensionLib' => ['AFExtensionLib/Assets/**/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #依赖的三方库
   s.dependency 'SnapKit',  '~> 5.0.1'
   s.dependency 'Hue', '~> 5.0.0'
   s.dependency 'Localize-Swift', '~> 3.2.0'
end
