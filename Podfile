source 'https://github.com/CocoaPods/Specs.git'

platform:ios,'8.0'
inhibit_all_warnings!

pod 'MJExtension', '~> 3.0.15'
pod 'MBProgressHUD', '~> 1.1.0'
pod 'AFNetworking', '~> 3.2.1'
pod 'SDWebImage', '~> 4.4.1'
pod 'IQKeyboardManager', '~> 6.1.1'
pod 'SAMKeychain', '~> 1.5.3'

#二维码
pod 'LBXScan/UI','~> 2.3'
pod 'LBXScan/LBXZBar','~> 2.3'

#Twwiter 推出的线上奔溃收集
pod 'Fabric', '~> 1.7.2'
pod 'Crashlytics', '~> 3.9.3'
# Firebase 的用户行为收集
pod 'Firebase/Analytics'
pod 'Firebase/Messaging'
pod 'Firebase/Performance'

# Log相关
pod 'CocoaLumberjack'

# RAC
pod 'ReactiveObjC', '~>3.1.1'


target 'huafener' do
flutter_application_path = '../huafener-flutter-f/flutter_module_t'

load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

install_all_flutter_pods(flutter_application_path)
end

target 'huafenerTests' do
  pod 'STAlertView', '~> 1.0.0'
end


