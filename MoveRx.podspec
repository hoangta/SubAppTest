Pod::Spec.new do |s|
    s.name         = "MoveRx"
    s.version      = "1.0.0"
    s.summary      = "Move87 subapp"
    s.homepage     = "https://dev.azure.com/revivalcare/move78/_git/moveRx"
    s.license      = { :type => "LGPL" }
    s.author       = { "Hoang Ta" => "ta.hoang@siliconprime.com" }
    s.source       = { :git => "https://github.com/hoangta/Oneline.git", :branch => 'main' }
    s.source_files  = 'MoveRX/**/*.{swift,xib,storyboard}'
    s.resource_bundles = { 'MoveRxAssets' => 'MoveRX/Assets.xcassets' }
    s.resources = 'MoveRX/Assets/**'
    s.exclude_files = 'MoveRX/AppDelegate.swift'
    s.ios.deployment_target = "12.0"
    s.swift_version = "5.0"
    s.dependency "Oneline"
    s.dependency "TinyConstraints"
    s.dependency "RxSwift"
    s.dependency "RxCocoa"
end
