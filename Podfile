# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
flipperkit_version = '0.42.0'

target 'SwiftReduxApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftReduxApp
  pod 'ReSwift', '~> 5.0.0'
  pod 'ReSwiftRouter', '~> 0.7.1'
  pod 'ReSwiftThunk', '~> 1.2.0'
  pod 'PromisesSwift'
  
  pod 'RxSwift', '~> 5.1.1'
  pod 'RxCocoa', '~> 5.1.1'
  
  pod 'Moya', '~> 14.0.0'
  pod 'SnapKit', '~> 5.0.1'
  
  pod 'IGListKit', '~> 4.0.0'
#  pod 'XCGLogger', '~> 7.0.1'
  
  # It is likely that you'll only want to include Flipper in debug builds,
  # in which case you add the `:configuration` directive:
  pod 'FlipperKit', '~>' + flipperkit_version, :configuration => 'Debug'
  pod 'FlipperKit/FlipperKitLayoutComponentKitSupport', '~>' + flipperkit_version, :configuration => 'Debug'
  pod 'FlipperKit/SKIOSNetworkPlugin', '~>' + flipperkit_version, :configuration => 'Debug'
  pod 'FlipperKit/FlipperKitUserDefaultsPlugin', '~>' + flipperkit_version, :configuration => 'Debug'
  # ...unfortunately at this time that means you'll need to explicitly mark
  # transitive dependencies as being for debug build only as well:
  pod 'Flipper-DoubleConversion', :configuration => 'Debug'
  pod 'Flipper-Folly', :configuration => 'Debug'
  pod 'Flipper-Glog', :configuration => 'Debug'
  pod 'Flipper-PeerTalk', :configuration => 'Debug'
  pod 'CocoaLibEvent', :configuration => 'Debug'
  pod 'OpenSSL-Universal', :configuration => 'Debug'
  pod 'CocoaAsyncSocket', :configuration => 'Debug'
  # NOTE Doing this may lead to a broken build if any of these are also
  #      transitive dependencies of other dependencies and are expected
  #      to be built as frameworks.
  #
  $static_framework = ['FlipperKit', 'Flipper', 'Flipper-Folly',
       'CocoaAsyncSocket', 'ComponentKit', 'Flipper-DoubleConversion',
       'Flipper-Glog', 'Flipper-PeerTalk', 'Flipper-RSocket', 'Yoga', 'YogaKit',
       'CocoaLibEvent', 'OpenSSL-Universal']
  
   pre_install do |installer|
      Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
      installer.pod_targets.each do |pod|
          if $static_framework.include?(pod.name)
            def pod.build_type;
              Pod::BuildType.static_library
            end
          end
        end
    end
end
