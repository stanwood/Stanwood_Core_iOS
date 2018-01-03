#
# Be sure to run `pod lib lint StanwoodCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StanwoodCore'
  s.version          = '0.1'
  s.summary          = 'Stanwood core libarary'

  s.description      = <<-DESC
Stanwood Core library will be a standard libarary used across all iOS projects
                       DESC

  s.homepage         = 'https://github.com/stanwood/Stanwood_Core'
  s.license          = { :type => 'Private', :file => 'LICENSE' }
  s.author           = { 'Tal Zion' => 'talezion@gmail.com' }
  s.source           = { :git => 'https://github.com/stanwood/Stanwood_Core.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'StanwoodCore/Classes/**/*'
end
