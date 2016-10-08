Pod::Spec.new do |s|
  s.name         = "XHTabBarSwift"
  s.version      = "1.1.1"
  s.summary      = "一行代码创建自定义TabBar,支持小红点,数字角标及自定义高度"
  s.homepage     = "https://github.com/CoderZhuXH/XHTabBarSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHTabBarSwift.git", :tag => s.version }
  s.source_files = "XHTabBarSwift", "*.{swift}"
  s.requires_arc = true
end
