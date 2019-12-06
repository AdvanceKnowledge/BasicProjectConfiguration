
Pod::Spec.new do |s|

  s.name         = 'BasicProjectConfiguration'
  s.version      = '0.0.1'
  s.summary      = 'Constant, extension'
  s.homepage     = 'https://github.com/AdvanceKnowledge/BasicProjectConfiguration'
  s.license      = 'MIT'
  s.author       = { 'wangyanlei' => '920048449@qq.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/AdvanceKnowledge/BasicProjectConfiguration.git', :tag => s.version }




  spec.source_files = 'Source/*.swift'

end
