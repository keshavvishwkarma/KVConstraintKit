
Pod::Spec.new do |s|
s.name             = 'KVConstraintKit'
s.version          = '1.0.0'
s.summary          = 'An impressive Auto layout DSL for iOS written in pure swift.'
s.homepage         = 'https://github.com/keshavvishwkarma/KVConstraintKit'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'keshav vishwkarma' => 'keshavvbe@gmail.com' }
s.source           = { :git => 'https://github.com/keshavvishwkarma/KVConstraintKit.git', :tag => s.version.to_s }

s.ios.deployment_target  = '8.0'
s.tvos.deployment_target = '9.0'

s.source_files = 'KVConstraintKit/*.swift'

end
