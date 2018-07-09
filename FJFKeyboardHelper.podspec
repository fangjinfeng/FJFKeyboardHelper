Pod::Spec.new do |s|
  s.name         = "FJFKeyboardHelper"
  s.version      = "0.0.2"
  s.summary      = "轻量级键盘管理器，核心代码只有一百多行，一句话解决键盘遮挡问题。"
  s.homepage     = "https://www.jianshu.com/p/34b50c7a111f"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'fangjinfeng' => '116418179@qq.com' }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/fangjinfeng/FJFKeyboardHelper.git", :tag => "0.0.2" }
  s.source_files = "FJFKeyboardHelper/*.{h,m}"
  s.requires_arc = true
  s.framework  = 'UIKit'
end
