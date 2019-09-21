# huafener-flutter
FLutter项目模板

pod 添加引用
flutter_application_path = '../huafener-f/huafenerc_flutter'
eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)

BitCode设置为NO

runScript增加对flutter库的脚本


"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build 
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed
