Pod::Spec.new do |s|
  s.name                  = 'Flutter'
  s.version               = '3.13.100' # 3.13.1
  s.summary               = 'A UI toolkit for beautiful and fast apps.'
  s.description           = 'SHAHZEB'
  s.homepage              = 'https://flutter.dev'
  s.license               = { :type => 'BSD', :text => 'COPYRIGHT'
  }
  s.author                = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.source                = { :http => 'https://storage.googleapis.com/flutter_infra_release/flutter/b20183e04096094bcc37d9cde2a4b96f5cc684cf/ios-release/artifacts.zip' }
  s.documentation_url     = 'https://flutter.dev/docs'
  s.platform              = :ios, '11.0'
  s.vendored_frameworks   = 'Flutter.xcframework'
end
