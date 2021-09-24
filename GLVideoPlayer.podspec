Pod::Spec.new do |s|
#name必须与文件名一致
s.name              = "GLVideoPlayer"

#更新代码必须修改版本号
s.version           = "1.0.4"
s.summary           = "It is a GLVideoPlayer used on iOS, which implement by Objective-C"
s.description       = <<-DESC
It is a GLVideoPlayer used on iOS, which implement by Objective-C.
DESC
s.homepage          = "https://github.com/ChenZhenChun/GLVideoPlayer"
s.license           = 'MIT'
s.author            = { "ChenZhenChun" => "346891964@qq.com" }

#submodules 是否支持子模块
s.source            = { :git => "https://github.com/ChenZhenChun/GLVideoPlayer.git", :tag => s.version, :submodules => true}
s.platform          = :ios, '8.0'
s.requires_arc = true

#source_files路径是相对podspec文件的路径
#image模块
s.subspec 'image' do |ss|
ss.resources = 'GLVideoPlayer/image/*.png'
end

#GLVideoPlayer模块
s.subspec 'GLVideoPlayer' do |ss|
ss.source_files = 'GLVideoPlayer/GLVideoPlayer/*.{h,m}'
ss.public_header_files = 'GLVideoPlayer/GLVideoPlayer/*.h'
ss.dependency 'SDWebImage'
end

s.frameworks = 'Foundation', 'UIKit'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'

end
