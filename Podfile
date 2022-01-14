# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!


workspace 'mobillium_case'
target 'mobillium_case' do
  project 'mobillium_case.xcodeproj'


  # Pods for mobillium_case
pod 'Alamofire', '~> 5.5'
pod 'Kingfisher', '~> 7.0'
  target 'mobillium_caseTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'mobillium_caseUITests' do
    # Pods for testing
  end

end
target 'DataSource' do
  
  project 'DataSource/DataSource.xcodeproj'
  
  # Pods for DataSource
  
  # Network
  pod 'Alamofire', '~> 5.5'
    
  target 'DataSourceTests' do
    inherit! :search_paths
    # Pods for testing
        
  end
  
end
target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  pod 'Kingfisher', '~> 7.0'

    
  target 'UIComponentsTests' do
    inherit! :search_paths
    # Pods for testing
        
  end
  
end