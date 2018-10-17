
use_frameworks!
platform :ios, '10.0'
inhibit_all_warnings!

target 'MyTestProject' do

  pod 'StanwoodAnalytics'
    pod 'StanwoodCore'
    pod 'StanwoodDebugger', :configurations => ['Debug']
    pod 'StanwoodDialog'
    pod 'Firebase'
    pod 'ReachabilitySwift'
    pod 'MBProgressHUD'
    pod 'Firebase/Core'
    pod 'Firebase/RemoteConfig'
    pod 'RMStore'
    pod 'IQKeyboardManagerSwift'
    pod 'FontAwesome.swift'
    pod 'Kingfisher'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|

        if ['StanwoodAnalytics'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.1'
            end
        end
    end
end
