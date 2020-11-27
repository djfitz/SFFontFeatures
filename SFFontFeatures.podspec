Pod::Spec.new do |s|
  s.name     = 'SFFontFeatures'
  s.version  = '1.0.2'
  s.platform = :ios, "10.0"
  s.license  = 'MIT'
  s.summary  = 'SanFranciscoFontFeatures provides an easy way to use the font features specific to the Apple System font known as San Francisco.'
  s.homepage = 'https://github.com/djfitz/SFFontFeatures'
  s.author   = { 'Doug Hill' => 'doug@breaqz.com' }
  s.source   = { :git => 'https://github.com/djfitz/SFFontFeatures.git', :tag => 'Cocoapods_1.0.2' }

  s.description = 'A convenience extension to UIFont for enabling features specific to the San Francisco font. Many of the features of the San Francisco font are enabled by odd OpenType settings (e.g. Alternate Stylistic Features) which aren\'t named in the SDK headers. This class extension abstracts the specifics to enable these features. See here for more info about the San Francisco Font: https://developer.apple.com/fonts/'

  s.source_files = '*.{h,m}'
  s.framework    = 'UIKit'
  s.requires_arc = true
end
