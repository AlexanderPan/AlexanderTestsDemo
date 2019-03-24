# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'



target 'AlexanderTestsDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    pod 'SnapKit', '~> 4.2.0'
    pod 'SwiftyJSON', '~> 4.2.0'
    pod 'Reusable', '~> 4.0.5'
    pod 'Kingfisher', '~> 4.1.1'
    pod 'SVProgressHUD'
  # Pods for AlexanderTestsDemo

  target 'AlexanderTestsDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AlexanderTestsDemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end



post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
    end
    
    
    installer.pods_project.targets.each do |target|
        if ['Kingfisher'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4'
            end
        end
        
        if ['RxBlocking','RxTest'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end
