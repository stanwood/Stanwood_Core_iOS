#
# Be sure to run `pod lib lint StanwoodCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'StanwoodCore'
    s.version          = '1.0'
    s.summary          = 'Stanwood core libarary'
    
    s.description      = <<-DESC
    Stanwood Core library will be a standard libarary used across all Stanwood iOS projects
    DESC
    
    s.homepage         = 'https://github.com/stanwood/Stanwood_Core'
    s.license          = { :type => 'Private', :file => 'LICENSE' }
    s.author           = { 'Tal Zion' => 'talezion@gmail.com' }
    s.source           = { :git => 'git@github.com:stanwood/Stanwood_Core.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.0'
    s.default_subspec = 'Base'
    
    s.subspec 'Base' do |ss|
        ss.source_files = [
        'StanwoodCore/Core/**/*',
        'StanwoodCore/Extensions/**/*',
        'StanwoodCore/Protocols/**/*'
        ]
    end
    
    # For now, UITesting subspec is part of StanwoodCore.
    # After Beta testing, we will move this to a dedicated pod framework.
    s.subspec 'UITesting' do |ss|
        ss.source_files = 'StanwoodCore/UITesting/**/*'
    end
    
end
