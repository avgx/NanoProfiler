Pod::Spec.new do |s|
  s.name = 'NanoProfiler'
  s.version = '0.0.1'
  s.summary = "Measure a function's runtime without adding a single line of code to the original function."
  s.homepage = 'https://github.com/tomersh/NanoProfiler'
  s.author = { 'Tomer Shiri' => 'thewrapper@shiri.info' }
  s.platform = :ios
  s.requires_arc = false
  s.source_files = 'src/*.{h,m}'
  s.source = { :git => 'git://github.com/itimofeev/NanoProfiler.git', :branch => 'vargs' }
  s.dependency 'theWrapper'
end
