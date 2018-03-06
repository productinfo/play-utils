#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "ShinobiPlayUtils"
  s.version          = '1.1.0'
  s.summary          = "Files common to ShinobiPlay projects"
  s.description      = <<-DESC
                       Files common to ShinobiPlay projects, e.g. utility classes and base classes
                       DESC
  s.homepage         = "https://www.shinobicontrols.com"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Alison Clarke" => "aclarke@scottlogic.co.uk" }
  s.source           = { :git => "https://github.com/ShinobiControls/play-utils.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shinobicontrols'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'ShinobiPlayUtils/ShinobiPlayUtils/**/*.{h,m}'
  s.resources = 'ShinobiPlayUtils/ShinobiPlayUtils/Fonts/*.ttf'
  s.frameworks = 'QuartzCore'
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(DEVELOPER_FRAMEWORKS_DIR)"' }
end
