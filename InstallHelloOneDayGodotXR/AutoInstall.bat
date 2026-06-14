..\..\adb devices
timeout /t 3

:: ..\..\adb uninstall org.fdroid.fdroid
:: ..\..\adb uninstall org.fossify.filemanager
:: ..\..\adb uninstall cn.rbc.termuc
:: ..\..\adb uninstall com.termux
:: ..\..\adb uninstall quest.side.vr


for /f "skip=1 tokens=1" %%A in ('..\..\adb devices') do (
    echo Installing on %%A
    echo "Install F-Droid on %%A"
    ..\..\adb -s %%A install -r -d -g F-Droid.apk
    echo "Install Termux and dependencies on %%A"
    ..\..\adb -s %%A install -r -d -g com.termux.apk
    echo "Install File Manager on %%A"    
    ..\..\adb -s %%A install -r -d -g org.fossify.filemanager.apk
    echo "Install Termuc on %%A"
    ..\..\adb -s %%A install -r -d -g cn.rbc.termuc.apk
    echo "Install SideQuest on %%A"
    ..\..\adb -s %%A install -r -d -g quest.side.vr.apk
    echo "Install XRTK on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\XRTK.apk
    echo "Install MRTK on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\MRTK.apk
    echo "Install VRTK on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\VRTK.apk
    echo "Install GRTK on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\GRTK.apk
    echo "Install GODOT on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\GODOT.apk
    echo "Install Blokc on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\OpenBlocks.apk
    echo "Install Brush on %%A"
    ..\..\adb -s %%A install -r -d -g BigAPK\OpenBrush.apk

    OpenBlocks.apk

    OpenBlocks.apk
    
    echo "Push the bootstrap.sh script to be executed later on %%A"
    ..\..\adb -s %%A push bootstrap.sh /sdcard/bootstrap.sh
    echo "Launch Termux on %%A"
    ..\..\adb -s %%A shell am start -n com.termux/.app.TermuxActivity
    timeout /t 15

    echo "Use Keyboard to move at documents on %%A"
    ..\..\adb -s %%A shell input text "cd%%s/storage/emulated/0/Documents"
    ..\..\adb -s %%A shell input keyevent 66

    echo "Check files in documents on %%A"
    ..\..\adb -s %%A shell input text "dir"
    ..\..\adb -s %%A shell input keyevent 66
    
    echo "Execute the bootstrap.sh script on %%A"
    echo "It install git, gh. Do a git clone and setup git config"    
    ..\..\adb -s %%A shell input text "bash%%s\/sdcard\/bootstrap.sh"
    ..\..\adb -s %%A shell input keyevent 66
    timeout /t 1
    ..\..\adb -s %%A shell input keyevent 66
    @REM timeout /t 60
    @REM ..\..\adb -s %%A shell input keyevent 66
    @REM ..\..\adb -s %%A shell input text "gh%%sauth%%slogin"
    @REM timeout /t 1
    @REM ..\..\adb -s %%A shell input keyevent 66


)

timeout /t 10
