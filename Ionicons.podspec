Pod::Spec.new do |spec|
  spec.name     = 'Ionicons'
  spec.version  = '1.3.5'
  spec.authors   = { 'Connor Grady' => 'conair360@gmail.com' }
  spec.license  = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage = 'https://github.com/itsjustcon/ionicons-objc'
  spec.summary  = 'Use the beautiful Ionicons font (http://ionicons.com/) in your native Objective-C projects.'
  spec.source   = { :git => 'https://github.com/itsjustcon/ionicons-objc.git' }
  spec.platform = :ios, '5.0'
  spec.source_files = '*.{h,m,plist}'
  spec.resources = [ 'Ionicons.plist' ]
  spec.resource_bundles = { 'Ionicons' => ['Ionicons.plist', 'ionicons.ttf'] }
  spec.requires_arc = true
  spec.xcconfig = { 'INFOPLIST_FILE' => 'Ionicons.plist' }
end