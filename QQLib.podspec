Pod::Spec.new do |s|
s.name         = "QQLib"
s.version      = "0.0.1"
s.ios.deployment_target = '6.0'
s.osx.deployment_target = '10.8'
s.summary      = "A fast and convenient conversion between JSON and model"
s.homepage     = "https://github.com/wei307449934/QQLib"
s.license      = "MIT"
s.author             = { "QQLib" => "419801324@qq.com" }
s.social_media_url   = "http://weibo.com/exceptions"
s.source       = { :git => "https://github.com/wei307449934/QQLib.git", :tag => s.version }
s.source_files  = "classes"
s.requires_arc = true
end
