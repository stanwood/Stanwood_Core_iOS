Pod::Spec.new do |s|
    s.name             = 'StanwoodCore'
    s.version          = '1.0'
    s.summary          = 'Stanwood core libarary'
    
    s.description      = <<-DESC
    Stanwood Core library is a standard libarary used across all Stanwood iOS projects.
    DESC
    
    s.homepage         = 'https://github.com/stanwood/Stanwood_Core'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Tal Zion' => 'tal.zion@stanwood.io' }
    s.source           = { :git => 'https://github.com/stanwood/Stanwood_Core.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '10.0'
    
    s.source_files = [
    'StanwoodCore/Core/**/*',
    'StanwoodCore/Extensions/**/*',
    'StanwoodCore/Protocols/**/*'
    ]
end
