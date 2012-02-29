.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ServerThread$AdbSettingsObserver;
    }
.end annotation


# static fields
.field private static final INCLUDE_DEMO:Z = false

.field private static final LOG_BOOT_PROGRESS_SYSTEM_RUN:I = 0xbc2

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 71
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/ServerThread;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 73

    .prologue
    .line 86
    const/16 v5, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    invoke-static {v5, v10, v11}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 89
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 91
    const/4 v5, -0x2

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 94
    const/4 v5, 0x1

    invoke-static {v5}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 95
    const/4 v5, 0x0

    invoke-static {v5}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 99
    const-string v5, "sys.shutdown.requested"

    const-string v6, ""

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v59

    .line 101
    .local v59, shutdownAction:Ljava/lang/String;
    if-eqz v59, :cond_0

    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 102
    const/4 v5, 0x0

    move-object/from16 v0, v59

    move v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x31

    if-ne v5, v6, :cond_6

    const/4 v5, 0x1

    move/from16 v56, v5

    .line 105
    .local v56, reboot:Z
    :goto_0
    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_7

    .line 106
    const/4 v5, 0x1

    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, v59

    move v1, v5

    move v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v55

    .line 111
    .local v55, reason:Ljava/lang/String;
    :goto_1
    move/from16 v0, v56

    move-object/from16 v1, v55

    invoke-static {v0, v1}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 115
    .end local v55           #reason:Ljava/lang/String;
    .end local v56           #reboot:Z
    :cond_0
    const-string v5, "ro.factorytest"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 116
    .local v42, factoryTestStr:Ljava/lang/String;
    const-string v5, ""

    move-object v0, v5

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    move/from16 v41, v5

    .line 119
    .local v41, factoryTest:I
    :goto_2
    const/16 v47, 0x0

    .line 120
    .local v47, lights:Lcom/android/server/LightsService;
    const/16 v54, 0x0

    .line 121
    .local v54, power:Lcom/android/server/PowerManagerService;
    const/16 v29, 0x0

    .line 122
    .local v29, battery:Lcom/android/server/BatteryService;
    const/16 v35, 0x0

    .line 123
    .local v35, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v53, 0x0

    .line 124
    .local v53, pm:Landroid/content/pm/IPackageManager;
    const/4 v6, 0x0

    .line 125
    .local v6, context:Landroid/content/Context;
    const/16 v72, 0x0

    .line 126
    .local v72, wm:Lcom/android/server/WindowManagerService;
    const/16 v30, 0x0

    .line 127
    .local v30, bluetooth:Landroid/server/BluetoothService;
    const/16 v32, 0x0

    .line 128
    .local v32, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v43, 0x0

    .line 129
    .local v43, headset:Lcom/android/server/HeadsetObserver;
    const/16 v38, 0x0

    .line 130
    .local v38, dock:Lcom/android/server/DockObserver;
    const/16 v66, 0x0

    .line 131
    .local v66, usb:Lcom/android/server/usb/UsbService;
    const/16 v68, 0x0

    .line 132
    .local v68, usbOtg:Lcom/android/server/UsbOtgObserver;
    const/16 v64, 0x0

    .line 133
    .local v64, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v57, 0x0

    .line 134
    .local v57, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v62, 0x0

    .line 138
    .local v62, throttle:Lcom/android/server/ThrottleService;
    :try_start_0
    const-string v5, "SystemServer"

    const-string v7, "Entropy Service"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    const-string v5, "entropy"

    new-instance v7, Lcom/android/server/EntropyService;

    invoke-direct {v7}, Lcom/android/server/EntropyService;-><init>()V

    invoke-static {v5, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 141
    const-string v5, "SystemServer"

    const-string v7, "Power Manager"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    new-instance v8, Lcom/android/server/PowerManagerService;

    invoke-direct {v8}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_28

    .line 143
    .end local v54           #power:Lcom/android/server/PowerManagerService;
    .local v8, power:Lcom/android/server/PowerManagerService;
    :try_start_1
    const-string v5, "power"

    invoke-static {v5, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 145
    const-string v5, "SystemServer"

    const-string v7, "Activity Manager"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-static/range {v41 .. v41}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v6

    .line 148
    const-string v5, "SystemServer"

    const-string v7, "Telephony Registry"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    const-string v5, "telephony.registry"

    new-instance v7, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v7, v6}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 151
    invoke-static {v6}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 153
    const-string v5, "SystemServer"

    const-string v7, "Package Manager"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    if-eqz v41, :cond_9

    const/4 v5, 0x1

    :goto_3
    invoke-static {v6, v5}, Lcom/android/server/PackageManagerService;->main(Landroid/content/Context;Z)Landroid/content/pm/IPackageManager;

    move-result-object v53

    .line 157
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 159
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 163
    :try_start_2
    const-string v5, "SystemServer"

    const-string v7, "Account Manager"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const-string v5, "account"

    new-instance v7, Landroid/accounts/AccountManagerService;

    invoke-direct {v7, v6}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 170
    :goto_4
    :try_start_3
    const-string v5, "SystemServer"

    const-string v7, "Content Manager"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    const/4 v5, 0x1

    move/from16 v0, v41

    move v1, v5

    if-ne v0, v1, :cond_a

    const/4 v5, 0x1

    :goto_5
    invoke-static {v6, v5}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/IContentService;

    .line 174
    const-string v5, "SystemServer"

    const-string v7, "System Content Providers"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 177
    const-string v5, "SystemServer"

    const-string v7, "Battery Service"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    new-instance v7, Lcom/android/server/BatteryService;

    invoke-direct {v7, v6}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 179
    .end local v29           #battery:Lcom/android/server/BatteryService;
    .local v7, battery:Lcom/android/server/BatteryService;
    :try_start_4
    const-string v5, "battery"

    invoke-static {v5, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 181
    const-string v5, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    new-instance v48, Lcom/android/server/LightsService;

    move-object/from16 v0, v48

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_29

    .line 184
    .end local v47           #lights:Lcom/android/server/LightsService;
    .local v48, lights:Lcom/android/server/LightsService;
    :try_start_5
    const-string v5, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const-string v5, "vibrator"

    new-instance v9, Lcom/android/server/VibratorService;

    invoke-direct {v9, v6}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 189
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    move-object v0, v8

    move-object v1, v6

    move-object/from16 v2, v48

    move-object v3, v5

    move-object v4, v7

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 191
    const-string v5, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    new-instance v9, Lcom/android/server/AlarmManagerService;

    invoke-direct {v9, v6}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V

    .line 193
    .local v9, alarm:Lcom/android/server/AlarmManagerService;
    const-string v5, "alarm"

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 195
    const-string v5, "SystemServer"

    const-string v10, "Init Watchdog"

    invoke-static {v5, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v5

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    invoke-virtual/range {v5 .. v10}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 199
    const-string v5, "SystemServer"

    const-string v9, "Window Manager"

    .end local v9           #alarm:Lcom/android/server/AlarmManagerService;
    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    const/4 v5, 0x1

    move/from16 v0, v41

    move v1, v5

    if-eq v0, v1, :cond_b

    const/4 v5, 0x1

    :goto_6
    invoke-static {v6, v8, v5}, Lcom/android/server/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;Z)Lcom/android/server/WindowManagerService;

    move-result-object v72

    .line 202
    const-string v5, "window"

    move-object v0, v5

    move-object/from16 v1, v72

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 204
    const-string v5, "activity"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/ActivityManagerService;

    move-object v0, v5

    move-object/from16 v1, v72

    invoke-virtual {v0, v1}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/WindowManagerService;)V

    .line 210
    const-string v5, "ro.kernel.qemu"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v9, "1"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 211
    const-string v5, "SystemServer"

    const-string v9, "Registering null Bluetooth Service (emulator)"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    const-string v5, "bluetooth"

    const/4 v9, 0x0

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_2

    :goto_7
    move-object/from16 v47, v48

    .line 241
    .end local v48           #lights:Lcom/android/server/LightsService;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    :goto_8
    const/16 v36, 0x0

    .line 242
    .local v36, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v60, 0x0

    .line 243
    .local v60, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v45, 0x0

    .line 244
    .local v45, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v27, 0x0

    .line 245
    .local v27, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v51, 0x0

    .line 246
    .local v51, notification:Lcom/android/server/NotificationManagerService;
    const/16 v70, 0x0

    .line 247
    .local v70, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v49, 0x0

    .line 249
    .local v49, location:Lcom/android/server/LocationManagerService;
    const/4 v5, 0x1

    move/from16 v0, v41

    move v1, v5

    if-eq v0, v1, :cond_1

    .line 251
    :try_start_6
    const-string v5, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    new-instance v37, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v37

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_3

    .line 253
    .end local v36           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v37, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_7
    const-string v5, "device_policy"

    move-object v0, v5

    move-object/from16 v1, v37

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_27

    move-object/from16 v36, v37

    .line 259
    .end local v37           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v36       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_9
    :try_start_8
    const-string v5, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    new-instance v61, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v61

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_4

    .line 261
    .end local v60           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v61, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_9
    const-string v5, "statusbar"

    move-object v0, v5

    move-object/from16 v1, v61

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_26

    move-object/from16 v60, v61

    .line 267
    .end local v61           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v60       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_a
    :try_start_a
    const-string v5, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    const-string v5, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v6}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_5

    .line 275
    :goto_b
    :try_start_b
    const-string v5, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    new-instance v46, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v46

    move-object v1, v6

    move-object/from16 v2, v60

    invoke-direct {v0, v1, v2}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_6

    .line 277
    .end local v45           #imm:Lcom/android/server/InputMethodManagerService;
    .local v46, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_c
    const-string v5, "input_method"

    move-object v0, v5

    move-object/from16 v1, v46

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_25

    move-object/from16 v45, v46

    .line 283
    .end local v46           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v45       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_c
    :try_start_d
    const-string v5, "SystemServer"

    const-string v9, "NetStat Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    const-string v5, "netstat"

    new-instance v9, Lcom/android/server/NetStatService;

    invoke-direct {v9, v6}, Lcom/android/server/NetStatService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_7

    .line 290
    :goto_d
    :try_start_e
    const-string v5, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    const-string v5, "network_management"

    invoke-static {v6}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v9

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_8

    .line 299
    :goto_e
    :try_start_f
    const-string v5, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    invoke-static {v6}, Lcom/android/server/ConnectivityService;->getInstance(Landroid/content/Context;)Lcom/android/server/ConnectivityService;

    move-result-object v35

    .line 301
    const-string v5, "connectivity"

    move-object v0, v5

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_9

    .line 307
    :goto_f
    :try_start_10
    const-string v5, "SystemServer"

    const-string v9, "Throttle Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    new-instance v63, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v63

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_a

    .line 309
    .end local v62           #throttle:Lcom/android/server/ThrottleService;
    .local v63, throttle:Lcom/android/server/ThrottleService;
    :try_start_11
    const-string v5, "throttle"

    move-object v0, v5

    move-object/from16 v1, v63

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_24

    move-object/from16 v62, v63

    .line 316
    .end local v63           #throttle:Lcom/android/server/ThrottleService;
    .restart local v62       #throttle:Lcom/android/server/ThrottleService;
    :goto_10
    :try_start_12
    const-string v5, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    const-string v5, "accessibility"

    new-instance v9, Lcom/android/server/AccessibilityManagerService;

    invoke-direct {v9, v6}, Lcom/android/server/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_b

    .line 328
    :goto_11
    :try_start_13
    const-string v5, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    const-string v5, "mount"

    new-instance v9, Lcom/android/server/MountService;

    invoke-direct {v9, v6}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_c

    .line 335
    :goto_12
    :try_start_14
    const-string v5, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    new-instance v52, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v52

    move-object v1, v6

    move-object/from16 v2, v60

    move-object/from16 v3, v47

    invoke-direct {v0, v1, v2, v3}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_d

    .line 337
    .end local v51           #notification:Lcom/android/server/NotificationManagerService;
    .local v52, notification:Lcom/android/server/NotificationManagerService;
    :try_start_15
    const-string v5, "notification"

    move-object v0, v5

    move-object/from16 v1, v52

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_23

    move-object/from16 v51, v52

    .line 343
    .end local v52           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v51       #notification:Lcom/android/server/NotificationManagerService;
    :goto_13
    :try_start_16
    const-string v5, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    const-string v5, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v6}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_e

    .line 351
    :goto_14
    :try_start_17
    const-string v5, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    new-instance v50, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v50

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_f

    .line 353
    .end local v49           #location:Lcom/android/server/LocationManagerService;
    .local v50, location:Lcom/android/server/LocationManagerService;
    :try_start_18
    const-string v5, "location"

    move-object v0, v5

    move-object/from16 v1, v50

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_22

    move-object/from16 v49, v50

    .line 359
    .end local v50           #location:Lcom/android/server/LocationManagerService;
    .restart local v49       #location:Lcom/android/server/LocationManagerService;
    :goto_15
    :try_start_19
    const-string v5, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    const-string v5, "search"

    new-instance v9, Landroid/server/search/SearchManagerService;

    invoke-direct {v9, v6}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_10

    .line 372
    :goto_16
    :try_start_1a
    const-string v5, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    const-string v5, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v11, "/data/system/dropbox"

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v6, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_11

    .line 380
    :goto_17
    :try_start_1b
    const-string v5, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    new-instance v71, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v71

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_12

    .line 382
    .end local v70           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v71, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_1c
    const-string v5, "wallpaper"

    move-object v0, v5

    move-object/from16 v1, v71

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_21

    move-object/from16 v70, v71

    .line 388
    .end local v71           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v70       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :goto_18
    :try_start_1d
    const-string v5, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    const-string v5, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v6}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_13

    .line 395
    :goto_19
    :try_start_1e
    const-string v5, "SystemServer"

    const-string v9, "Headset Observer"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    new-instance v44, Lcom/android/server/HeadsetObserver;

    move-object/from16 v0, v44

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/HeadsetObserver;-><init>(Landroid/content/Context;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_14

    .end local v43           #headset:Lcom/android/server/HeadsetObserver;
    .local v44, headset:Lcom/android/server/HeadsetObserver;
    move-object/from16 v43, v44

    .line 403
    .end local v44           #headset:Lcom/android/server/HeadsetObserver;
    .restart local v43       #headset:Lcom/android/server/HeadsetObserver;
    :goto_1a
    :try_start_1f
    const-string v5, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    new-instance v39, Lcom/android/server/DockObserver;

    move-object/from16 v0, v39

    move-object v1, v6

    move-object v2, v8

    invoke-direct {v0, v1, v2}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_15

    .end local v38           #dock:Lcom/android/server/DockObserver;
    .local v39, dock:Lcom/android/server/DockObserver;
    move-object/from16 v38, v39

    .line 411
    .end local v39           #dock:Lcom/android/server/DockObserver;
    .restart local v38       #dock:Lcom/android/server/DockObserver;
    :goto_1b
    :try_start_20
    const-string v5, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    new-instance v67, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v67

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_16

    .line 414
    .end local v66           #usb:Lcom/android/server/usb/UsbService;
    .local v67, usb:Lcom/android/server/usb/UsbService;
    :try_start_21
    const-string v5, "usb"

    move-object v0, v5

    move-object/from16 v1, v67

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_20

    move-object/from16 v66, v67

    .line 420
    .end local v67           #usb:Lcom/android/server/usb/UsbService;
    .restart local v66       #usb:Lcom/android/server/usb/UsbService;
    :goto_1c
    :try_start_22
    const-string v5, "SystemServer"

    const-string v9, "USB OTG Observer"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    new-instance v69, Lcom/android/server/UsbOtgObserver;

    move-object/from16 v0, v69

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/UsbOtgObserver;-><init>(Landroid/content/Context;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_17

    .end local v68           #usbOtg:Lcom/android/server/UsbOtgObserver;
    .local v69, usbOtg:Lcom/android/server/UsbOtgObserver;
    move-object/from16 v68, v69

    .line 428
    .end local v69           #usbOtg:Lcom/android/server/UsbOtgObserver;
    .restart local v68       #usbOtg:Lcom/android/server/UsbOtgObserver;
    :goto_1d
    :try_start_23
    const-string v5, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    new-instance v65, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v65

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_18

    .end local v64           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v65, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v64, v65

    .line 436
    .end local v65           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v64       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_1e
    :try_start_24
    const-string v5, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    const-string v5, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v6}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_19

    .line 444
    :goto_1f
    :try_start_25
    const-string v5, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    new-instance v28, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v28

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_1a

    .line 446
    .end local v27           #appWidget:Lcom/android/server/AppWidgetService;
    .local v28, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_26
    const-string v5, "appwidget"

    move-object v0, v5

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_1f

    move-object/from16 v27, v28

    .line 452
    .end local v28           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v27       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_20
    :try_start_27
    const-string v5, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    new-instance v58, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v58

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_1b

    .end local v57           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v58, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v57, v58

    .line 459
    .end local v58           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v57       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_21
    :try_start_28
    const-string v5, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    const-string v5, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v6}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_1c

    .line 467
    .end local v6           #context:Landroid/content/Context;
    :cond_1
    :goto_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    move-object v5, v0

    const-string v6, "adb_enabled"

    const-string v9, "1"

    const-string v10, "persist.service.adb.enable"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    const/4 v9, 0x1

    :goto_23
    invoke-static {v5, v6, v9}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    move-object v5, v0

    const-string v6, "adb_enabled"

    invoke-static {v6}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    const/4 v9, 0x0

    new-instance v10, Lcom/android/server/ServerThread$AdbSettingsObserver;

    move-object v0, v10

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/server/ServerThread$AdbSettingsObserver;-><init>(Lcom/android/server/ServerThread;)V

    invoke-virtual {v5, v6, v9, v10}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 476
    invoke-virtual/range {v72 .. v72}, Lcom/android/server/WindowManagerService;->detectSafeMode()Z

    move-result v21

    .line 477
    .local v21, safeMode:Z
    if-eqz v21, :cond_10

    .line 479
    :try_start_29
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/app/IActivityManager;->enterSafeMode()V

    .line 481
    const/4 v5, 0x1

    sput-boolean v5, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 483
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v5

    invoke-virtual {v5}, Ldalvik/system/VMRuntime;->disableJitCompilation()V
    :try_end_29
    .catch Landroid/os/RemoteException; {:try_start_29 .. :try_end_29} :catch_1e

    .line 493
    :goto_24
    if-eqz v36, :cond_2

    .line 494
    invoke-virtual/range {v36 .. v36}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V

    .line 497
    :cond_2
    if-eqz v51, :cond_3

    .line 498
    invoke-virtual/range {v51 .. v51}, Lcom/android/server/NotificationManagerService;->systemReady()V

    .line 501
    :cond_3
    if-eqz v60, :cond_4

    .line 502
    invoke-virtual/range {v60 .. v60}, Lcom/android/server/StatusBarManagerService;->systemReady()V

    .line 504
    :cond_4
    invoke-virtual/range {v72 .. v72}, Lcom/android/server/WindowManagerService;->systemReady()V

    .line 505
    invoke-virtual {v8}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 507
    :try_start_2a
    invoke-interface/range {v53 .. v53}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_2a
    .catch Landroid/os/RemoteException; {:try_start_2a .. :try_end_2a} :catch_1d

    .line 512
    :goto_25
    move-object/from16 v12, v60

    .line 513
    .local v12, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object v13, v7

    .line 514
    .local v13, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v14, v35

    .line 515
    .local v14, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v15, v38

    .line 516
    .local v15, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v16, v66

    .line 517
    .local v16, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v17, v68

    .line 518
    .local v17, usbOtgF:Lcom/android/server/UsbOtgObserver;
    move-object/from16 v25, v62

    .line 519
    .local v25, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v18, v64

    .line 520
    .local v18, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v20, v27

    .line 521
    .local v20, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v22, v70

    .line 522
    .local v22, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v23, v45

    .line 523
    .local v23, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v19, v57

    .line 524
    .local v19, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v24, v49

    .line 531
    .local v24, locationF:Lcom/android/server/LocationManagerService;
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/ActivityManagerService;

    new-instance v10, Lcom/android/server/ServerThread$1;

    move-object/from16 v11, p0

    invoke-direct/range {v10 .. v25}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;Lcom/android/server/StatusBarManagerService;Lcom/android/server/BatteryService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UsbOtgObserver;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/ThrottleService;)V

    invoke-virtual {v5, v10}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 558
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 559
    const-string v5, "SystemServer"

    const-string v6, "Enabled StrictMode for system server main thread."

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    :cond_5
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 563
    const-string v5, "SystemServer"

    const-string v6, "System ServerThread is exiting!"

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    return-void

    .line 102
    .end local v7           #battery:Lcom/android/server/BatteryService;
    .end local v8           #power:Lcom/android/server/PowerManagerService;
    .end local v12           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v13           #batteryF:Lcom/android/server/BatteryService;
    .end local v14           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v15           #dockF:Lcom/android/server/DockObserver;
    .end local v16           #usbF:Lcom/android/server/usb/UsbService;
    .end local v17           #usbOtgF:Lcom/android/server/UsbOtgObserver;
    .end local v18           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v19           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v20           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v21           #safeMode:Z
    .end local v22           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v23           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v24           #locationF:Lcom/android/server/LocationManagerService;
    .end local v25           #throttleF:Lcom/android/server/ThrottleService;
    .end local v27           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v30           #bluetooth:Landroid/server/BluetoothService;
    .end local v32           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v35           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v36           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v38           #dock:Lcom/android/server/DockObserver;
    .end local v41           #factoryTest:I
    .end local v42           #factoryTestStr:Ljava/lang/String;
    .end local v43           #headset:Lcom/android/server/HeadsetObserver;
    .end local v45           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v47           #lights:Lcom/android/server/LightsService;
    .end local v49           #location:Lcom/android/server/LocationManagerService;
    .end local v51           #notification:Lcom/android/server/NotificationManagerService;
    .end local v53           #pm:Landroid/content/pm/IPackageManager;
    .end local v57           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v60           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v62           #throttle:Lcom/android/server/ThrottleService;
    .end local v64           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v66           #usb:Lcom/android/server/usb/UsbService;
    .end local v68           #usbOtg:Lcom/android/server/UsbOtgObserver;
    .end local v70           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v72           #wm:Lcom/android/server/WindowManagerService;
    :cond_6
    const/4 v5, 0x0

    move/from16 v56, v5

    goto/16 :goto_0

    .line 108
    .restart local v56       #reboot:Z
    :cond_7
    const/16 v55, 0x0

    .restart local v55       #reason:Ljava/lang/String;
    goto/16 :goto_1

    .line 116
    .end local v55           #reason:Ljava/lang/String;
    .end local v56           #reboot:Z
    .restart local v42       #factoryTestStr:Ljava/lang/String;
    :cond_8
    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    move/from16 v41, v5

    goto/16 :goto_2

    .line 154
    .restart local v6       #context:Landroid/content/Context;
    .restart local v8       #power:Lcom/android/server/PowerManagerService;
    .restart local v29       #battery:Lcom/android/server/BatteryService;
    .restart local v30       #bluetooth:Landroid/server/BluetoothService;
    .restart local v32       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v35       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v38       #dock:Lcom/android/server/DockObserver;
    .restart local v41       #factoryTest:I
    .restart local v43       #headset:Lcom/android/server/HeadsetObserver;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    .restart local v53       #pm:Landroid/content/pm/IPackageManager;
    .restart local v57       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v62       #throttle:Lcom/android/server/ThrottleService;
    .restart local v64       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v66       #usb:Lcom/android/server/usb/UsbService;
    .restart local v68       #usbOtg:Lcom/android/server/UsbOtgObserver;
    .restart local v72       #wm:Lcom/android/server/WindowManagerService;
    :cond_9
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 166
    :catch_0
    move-exception v5

    move-object/from16 v40, v5

    .line 167
    .local v40, e:Ljava/lang/Throwable;
    :try_start_2b
    const-string v5, "SystemServer"

    const-string v7, "Failure starting Account Manager"

    move-object v0, v5

    move-object v1, v7

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2b
    .catch Ljava/lang/RuntimeException; {:try_start_2b .. :try_end_2b} :catch_1

    goto/16 :goto_4

    .line 237
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_1
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v7, v29

    .line 238
    .end local v29           #battery:Lcom/android/server/BatteryService;
    .restart local v7       #battery:Lcom/android/server/BatteryService;
    .local v40, e:Ljava/lang/RuntimeException;
    :goto_26
    const-string v5, "System"

    const-string v9, "Failure starting core service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_8

    .line 171
    .end local v7           #battery:Lcom/android/server/BatteryService;
    .end local v40           #e:Ljava/lang/RuntimeException;
    .restart local v29       #battery:Lcom/android/server/BatteryService;
    :cond_a
    const/4 v5, 0x0

    goto/16 :goto_5

    .line 200
    .end local v29           #battery:Lcom/android/server/BatteryService;
    .end local v47           #lights:Lcom/android/server/LightsService;
    .restart local v7       #battery:Lcom/android/server/BatteryService;
    .restart local v48       #lights:Lcom/android/server/LightsService;
    :cond_b
    const/4 v5, 0x0

    goto/16 :goto_6

    .line 213
    :cond_c
    const/4 v5, 0x1

    move/from16 v0, v41

    move v1, v5

    if-ne v0, v1, :cond_d

    .line 214
    :try_start_2c
    const-string v5, "SystemServer"

    const-string v9, "Registering null Bluetooth Service (factory test)"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const-string v5, "bluetooth"

    const/4 v9, 0x0

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    goto/16 :goto_7

    .line 237
    :catch_2
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v47, v48

    .end local v48           #lights:Lcom/android/server/LightsService;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    goto :goto_26

    .line 217
    .end local v47           #lights:Lcom/android/server/LightsService;
    .restart local v48       #lights:Lcom/android/server/LightsService;
    :cond_d
    const-string v5, "SystemServer"

    const-string v9, "Bluetooth Service"

    invoke-static {v5, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    new-instance v31, Landroid/server/BluetoothService;

    move-object/from16 v0, v31

    move-object v1, v6

    invoke-direct {v0, v1}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_2c .. :try_end_2c} :catch_2

    .line 219
    .end local v30           #bluetooth:Landroid/server/BluetoothService;
    .local v31, bluetooth:Landroid/server/BluetoothService;
    :try_start_2d
    const-string v5, "bluetooth"

    move-object v0, v5

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 220
    invoke-virtual/range {v31 .. v31}, Landroid/server/BluetoothService;->initAfterRegistration()V

    .line 221
    new-instance v33, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v33

    move-object v1, v6

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_2d
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_2d} :catch_2a

    .line 222
    .end local v32           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v33, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_2e
    const-string v5, "bluetooth_a2dp"

    move-object v0, v5

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    move-object v5, v0

    const-string v9, "bluetooth_on"

    const/4 v10, 0x0

    invoke-static {v5, v9, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v34

    .line 228
    .local v34, bluetoothOn:I
    if-lez v34, :cond_e

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    move-object v5, v0

    const-string v9, "airplane_mode_on"

    const/4 v10, 0x0

    invoke-static {v5, v9, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v26

    .line 231
    .local v26, airplaneModeOn:I
    if-nez v26, :cond_e

    .line 232
    invoke-virtual/range {v31 .. v31}, Landroid/server/BluetoothService;->enable()Z
    :try_end_2e
    .catch Ljava/lang/RuntimeException; {:try_start_2e .. :try_end_2e} :catch_2b

    .end local v26           #airplaneModeOn:I
    :cond_e
    move-object/from16 v32, v33

    .end local v33           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v32       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v30, v31

    .end local v31           #bluetooth:Landroid/server/BluetoothService;
    .restart local v30       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_7

    .line 254
    .end local v34           #bluetoothOn:I
    .end local v48           #lights:Lcom/android/server/LightsService;
    .restart local v27       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v36       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v45       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    .restart local v49       #location:Lcom/android/server/LocationManagerService;
    .restart local v51       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v60       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v70       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3
    move-exception v5

    move-object/from16 v40, v5

    .line 255
    .local v40, e:Ljava/lang/Throwable;
    :goto_27
    const-string v5, "SystemServer"

    const-string v9, "Failure starting DevicePolicyService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_9

    .line 262
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_4
    move-exception v5

    move-object/from16 v40, v5

    .line 263
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_28
    const-string v5, "SystemServer"

    const-string v9, "Failure starting StatusBarManagerService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_a

    .line 270
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_5
    move-exception v5

    move-object/from16 v40, v5

    .line 271
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Clipboard Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 278
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_6
    move-exception v5

    move-object/from16 v40, v5

    .line 279
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_29
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Input Manager Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    .line 285
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_7
    move-exception v5

    move-object/from16 v40, v5

    .line 286
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting NetStat Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_d

    .line 294
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_8
    move-exception v5

    move-object/from16 v40, v5

    .line 295
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting NetworkManagement Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_e

    .line 302
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_9
    move-exception v5

    move-object/from16 v40, v5

    .line 303
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Connectivity Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_f

    .line 311
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_a
    move-exception v5

    move-object/from16 v40, v5

    .line 312
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2a
    const-string v5, "SystemServer"

    const-string v9, "Failure starting ThrottleService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_10

    .line 319
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_b
    move-exception v5

    move-object/from16 v40, v5

    .line 320
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Accessibility Manager"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_11

    .line 330
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_c
    move-exception v5

    move-object/from16 v40, v5

    .line 331
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Mount Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_12

    .line 338
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_d
    move-exception v5

    move-object/from16 v40, v5

    .line 339
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2b
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Notification Manager"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_13

    .line 346
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_e
    move-exception v5

    move-object/from16 v40, v5

    .line 347
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting DeviceStorageMonitor service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_14

    .line 354
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_f
    move-exception v5

    move-object/from16 v40, v5

    .line 355
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2c
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Location Manager"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_15

    .line 362
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_10
    move-exception v5

    move-object/from16 v40, v5

    .line 363
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Search Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_16

    .line 375
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_11
    move-exception v5

    move-object/from16 v40, v5

    .line 376
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting DropBoxManagerService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_17

    .line 383
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_12
    move-exception v5

    move-object/from16 v40, v5

    .line 384
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2d
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Wallpaper Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_18

    .line 390
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_13
    move-exception v5

    move-object/from16 v40, v5

    .line 391
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Audio Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_19

    .line 398
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_14
    move-exception v5

    move-object/from16 v40, v5

    .line 399
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting HeadsetObserver"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1a

    .line 406
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_15
    move-exception v5

    move-object/from16 v40, v5

    .line 407
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting DockObserver"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1b

    .line 415
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_16
    move-exception v5

    move-object/from16 v40, v5

    .line 416
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2e
    const-string v5, "SystemServer"

    const-string v9, "Failure starting UsbService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1c

    .line 423
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_17
    move-exception v5

    move-object/from16 v40, v5

    .line 424
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting UsbOtgObserver"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1d

    .line 431
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_18
    move-exception v5

    move-object/from16 v40, v5

    .line 432
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting UiModeManagerService"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1e

    .line 439
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_19
    move-exception v5

    move-object/from16 v40, v5

    .line 440
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1f

    .line 447
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_1a
    move-exception v5

    move-object/from16 v40, v5

    .line 448
    .restart local v40       #e:Ljava/lang/Throwable;
    :goto_2f
    const-string v5, "SystemServer"

    const-string v9, "Failure starting AppWidget Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_20

    .line 454
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_1b
    move-exception v5

    move-object/from16 v40, v5

    .line 455
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v9, "Failure starting Recognition Service"

    move-object v0, v5

    move-object v1, v9

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_21

    .line 461
    .end local v40           #e:Ljava/lang/Throwable;
    :catch_1c
    move-exception v5

    move-object/from16 v40, v5

    .line 462
    .restart local v40       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v6, "Failure starting DiskStats Service"

    .end local v6           #context:Landroid/content/Context;
    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, v40

    invoke-static {v0, v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_22

    .line 467
    .end local v40           #e:Ljava/lang/Throwable;
    :cond_f
    const/4 v9, 0x0

    goto/16 :goto_23

    .line 488
    .restart local v21       #safeMode:Z
    :cond_10
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v5

    invoke-virtual {v5}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_24

    .line 508
    :catch_1d
    move-exception v5

    goto/16 :goto_25

    .line 484
    :catch_1e
    move-exception v5

    goto/16 :goto_24

    .line 447
    .end local v21           #safeMode:Z
    .end local v27           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v6       #context:Landroid/content/Context;
    .restart local v28       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_1f
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v27, v28

    .end local v28           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v27       #appWidget:Lcom/android/server/AppWidgetService;
    goto :goto_2f

    .line 415
    .end local v66           #usb:Lcom/android/server/usb/UsbService;
    .restart local v67       #usb:Lcom/android/server/usb/UsbService;
    :catch_20
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v66, v67

    .end local v67           #usb:Lcom/android/server/usb/UsbService;
    .restart local v66       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_2e

    .line 383
    .end local v70           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v71       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_21
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v70, v71

    .end local v71           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v70       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_2d

    .line 354
    .end local v49           #location:Lcom/android/server/LocationManagerService;
    .restart local v50       #location:Lcom/android/server/LocationManagerService;
    :catch_22
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v49, v50

    .end local v50           #location:Lcom/android/server/LocationManagerService;
    .restart local v49       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_2c

    .line 338
    .end local v51           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v52       #notification:Lcom/android/server/NotificationManagerService;
    :catch_23
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v51, v52

    .end local v52           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v51       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_2b

    .line 311
    .end local v62           #throttle:Lcom/android/server/ThrottleService;
    .restart local v63       #throttle:Lcom/android/server/ThrottleService;
    :catch_24
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v62, v63

    .end local v63           #throttle:Lcom/android/server/ThrottleService;
    .restart local v62       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_2a

    .line 278
    .end local v45           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v46       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_25
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v45, v46

    .end local v46           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v45       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_29

    .line 262
    .end local v60           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v61       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_26
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v60, v61

    .end local v61           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v60       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_28

    .line 254
    .end local v36           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v37       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_27
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v36, v37

    .end local v37           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v36       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_27

    .line 237
    .end local v7           #battery:Lcom/android/server/BatteryService;
    .end local v8           #power:Lcom/android/server/PowerManagerService;
    .end local v27           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v36           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v45           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v49           #location:Lcom/android/server/LocationManagerService;
    .end local v51           #notification:Lcom/android/server/NotificationManagerService;
    .end local v60           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v70           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v29       #battery:Lcom/android/server/BatteryService;
    .restart local v54       #power:Lcom/android/server/PowerManagerService;
    :catch_28
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v7, v29

    .end local v29           #battery:Lcom/android/server/BatteryService;
    .restart local v7       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v8, v54

    .end local v54           #power:Lcom/android/server/PowerManagerService;
    .restart local v8       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_26

    :catch_29
    move-exception v5

    move-object/from16 v40, v5

    goto/16 :goto_26

    .end local v30           #bluetooth:Landroid/server/BluetoothService;
    .end local v47           #lights:Lcom/android/server/LightsService;
    .restart local v31       #bluetooth:Landroid/server/BluetoothService;
    .restart local v48       #lights:Lcom/android/server/LightsService;
    :catch_2a
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v30, v31

    .end local v31           #bluetooth:Landroid/server/BluetoothService;
    .restart local v30       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v47, v48

    .end local v48           #lights:Lcom/android/server/LightsService;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_26

    .end local v30           #bluetooth:Landroid/server/BluetoothService;
    .end local v32           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v47           #lights:Lcom/android/server/LightsService;
    .restart local v31       #bluetooth:Landroid/server/BluetoothService;
    .restart local v33       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v48       #lights:Lcom/android/server/LightsService;
    :catch_2b
    move-exception v5

    move-object/from16 v40, v5

    move-object/from16 v32, v33

    .end local v33           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v32       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v30, v31

    .end local v31           #bluetooth:Landroid/server/BluetoothService;
    .restart local v30       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v47, v48

    .end local v48           #lights:Lcom/android/server/LightsService;
    .restart local v47       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_26
.end method