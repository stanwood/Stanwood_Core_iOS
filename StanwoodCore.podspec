Pod::Spec.new do |s|
    s.name             = 'StanwoodCore'
    s.version          = '1.5.0'
    s.summary          = 'Stanwood core libarary'
    
    s.description      = <<-DESC
    Stanwood Core library is a standard libarary used across all Stanwood iOS projects. It included the Stanwood architecture base, helper classes, and extensions
    DESC
    
    s.homepage         = 'https://github.com/Stanwood_Core'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'stanwood' => 'ios.frameworks@stanwood.io' }
    s.source           = { :git => 'https://github.com/Stanwood_Core.git', :tag => s.version.to_s }
    s.documentation_url = 'https://stanwood.github.io/Stanwood_Core'
    
    s.ios.deployment_target = '10.0'
    s.swift_version = '5.0'
    
    s.source_files = [
    'StanwoodCore/Core/**/*',
    'StanwoodCore/Extensions/**/*',
    'StanwoodCore/Protocols/**/*'
    ]
end
