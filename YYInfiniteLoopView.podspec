Pod::Spec.new do |s|
  s.name         = "YYInfiniteLoopView"
  s.version      = "0.1.0"
  s.summary      = "使用UICollectionView封装的无限轮播视图,使用简单,提供多种属性自由设置样式."
  s.description  = <<-DESC
                    使用UICollectionView封装的无限轮播视图,使用简单,提供多种属性自由设置样式.
                   DESC
  s.homepage     = "https://github.com/Kejiasir" 
  s.license      = "MIT" 
  s.author       = { "Arvin" => "yasir86@126.com" }  
  s.platform     = :ios, "7.0" 
  s.ios.deployment_target = "7.0" 
  s.source       = { :git => "https://github.com/Kejiasir/YYInfiniteLoopView-demo.git", :tag => s.version }
  s.source_files = "YYInfiniteLoopView-demo/YYInfiniteLoopView-demo/YYInfiniteLoopView/*.{h,m}"  
  s.requires_arc = true 
  s.dependency "SDWebImage", "~> 3.8"
end
