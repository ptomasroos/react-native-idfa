Pod::Spec.new do |s|
  s.name         = "react-native-idfa"
  s.version      = "1.0.5"
  s.summary      = "A function to get IDFA for react-native"
  s.author       = ""

  s.homepage     = "https://github.com/happypancake/react-native-idfa"

  s.license      = "MIT"
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/happypancake/react-native-idfa.git", :tag => "#{s.version}" }

  s.source_files  = "ios/IDFA/*.{h,m}"

  s.dependency "React"
end
