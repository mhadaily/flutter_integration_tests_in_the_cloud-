pushd android
# # flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd

gcloud auth activate-service-account --key-file=mj-coffee-9f1ef-ef6e938a5ce5.json

gcloud --quiet config set project mj-coffee-9f1ef

gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --use-orchestrator \
  --timeout 3m \
  --results-bucket=gs://integration_results_mjcoffee \
  --results-dir=tests/firebase

## > gcloud firebase test android models list
# gcloud firebase test android run --type instrumentation \
#   --app build/app/outputs/apk/debug/app-debug.apk \
#   --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
#   --device-ids=blueline,OnePlus5T,x1q,redfin,flame \
#   --os-version-ids=25,26,27,28,29,30 \
#   --locales=en_GB,es \
#   --orientations=portrait,landscape \
#   --use-orchestrator \
#   --timeout 40m \
#   --results-bucket=gs://integration_results_mjcoffee \
#   --results-dir=tests/firebase  



# ───────────────────┬────────────┬─────────────────────────────────────┬──────────┬─────────────┬─────────────────────────┬────────────────┐
# │      MODEL_ID     │    MAKE    │              MODEL_NAME             │   FORM   │  RESOLUTION │      OS_VERSION_IDS     │      TAGS      │
# ├───────────────────┼────────────┼─────────────────────────────────────┼──────────┼─────────────┼─────────────────────────┼────────────────┤
# │ 1725              │ Vivo       │ vivo 1725                           │ PHYSICAL │ 2280 x 1080 │ 27                      │                │
# │ 1805              │ Vivo       │ vivo 1805                           │ PHYSICAL │ 2316 x 1080 │ 27                      │                │
# │ AOP_sprout        │ HMD Global │ Nokia 9                             │ PHYSICAL │ 2880 x 1440 │ 28                      │                │
# │ ASUS_X00T_3       │ Asus       │ ASUS_X00TD                          │ PHYSICAL │ 1080 x 2160 │ 27,28                   │                │
# │ AmatiTvEmulator   │ Google     │ Google TV Amati                     │ EMULATOR │ 1080 x 1920 │ 29                      │ beta=29, alpha │
# │ F8332             │ Sony       │ F8332                               │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ FRT               │ HMD Global │ Nokia 1                             │ PHYSICAL │  854 x 480  │ 27                      │                │
# │ G8142             │ Sony       │ G8142                               │ PHYSICAL │ 1080 x 1920 │ 25,26                   │                │
# │ G8342             │ Sony       │ G8342                               │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ G8441             │ Sony       │ G8441                               │ PHYSICAL │  720 x 1280 │ 26                      │                │
# │ GoogleTvEmulator  │ Google     │ Google TV                           │ EMULATOR │  720 x 1280 │ 30                      │ beta=30, alpha │
# │ H8216             │ Sony       │ H8216                               │ PHYSICAL │ 2160 x 1080 │ 28                      │                │
# │ H8296             │ Sony       │ H8296                               │ PHYSICAL │ 2160 x 1080 │ 28                      │                │
# │ H8314             │ Sony       │ H8314                               │ PHYSICAL │ 1080 x 2160 │ 26                      │                │
# │ H8324             │ Sony       │ H8324                               │ PHYSICAL │ 2160 x 1080 │ 26                      │                │
# │ H9493             │ Sony       │ H9493                               │ PHYSICAL │ 2880 x 1440 │ 28                      │                │
# │ HUR               │ SHARP      │ SHV39                               │ PHYSICAL │ 2560 x 1440 │ 28                      │                │
# │ HWANE-LX1         │ Huawei     │ ANE-LX1                             │ PHYSICAL │ 1080 x 2280 │ 28                      │                │
# │ HWANE-LX2         │ Huawei     │ ANE-LX2                             │ PHYSICAL │ 1080 x 2280 │ 28                      │                │
# │ HWCOR             │ Huawei     │ COR-L29                             │ PHYSICAL │ 1080 x 2340 │ 27                      │                │
# │ HWMHA             │ Huawei     │ MHA-L29                             │ PHYSICAL │ 1920 x 1080 │ 24                      │                │
# │ L-01J             │ LG         │ L-01J                               │ PHYSICAL │ 2720 x 1440 │ 26                      │                │
# │ Nexus10           │ Samsung    │ Nexus 10                            │ VIRTUAL  │ 2560 x 1600 │ 19,21,22                │                │
# │ Nexus4            │ LG         │ Nexus 4                             │ VIRTUAL  │ 1280 x 768  │ 19,21,22                │                │
# │ Nexus5            │ LG         │ Nexus 5                             │ VIRTUAL  │ 1920 x 1080 │ 19,21,22,23             │                │
# │ Nexus5X           │ LG         │ Nexus 5X                            │ VIRTUAL  │ 1920 x 1080 │ 23,24,25,26             │                │
# │ Nexus6            │ Motorola   │ Nexus 6                             │ VIRTUAL  │ 2560 x 1440 │ 21,22,23,24,25          │                │
# │ Nexus6P           │ Google     │ Nexus 6P                            │ VIRTUAL  │ 2560 x 1440 │ 23,24,25,26,27          │                │
# │ Nexus7            │ Asus       │ Nexus 7 (2012)                      │ VIRTUAL  │ 1280 x 800  │ 19,21,22                │                │
# │ Nexus7_clone_16_9 │ Generic    │ Nexus7 clone, DVD 16:9 aspect ratio │ VIRTUAL  │ 1280 x 720  │ 23,24,25,26             │ beta           │
# │ Nexus9            │ HTC        │ Nexus 9                             │ VIRTUAL  │ 2048 x 1536 │ 21,22,23,24,25          │                │
# │ NexusLowRes       │ Generic    │ Low-resolution MDPI phone           │ VIRTUAL  │  640 x 360  │ 23,24,25,26,27,28,29,30 │ beta=30        │
# │ OnePlus3T         │ OnePlus    │ ONEPLUS A3003                       │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ OnePlus5T         │ OnePlus    │ ONEPLUS A5010                       │ PHYSICAL │ 1080 x 2160 │ 28                      │                │
# │ Pixel2            │ Google     │ Pixel 2                             │ VIRTUAL  │ 1920 x 1080 │ 26,27,28,29,30          │ beta=30        │
# │ SC-02J            │ Samsung    │ SC-02J                              │ PHYSICAL │ 2960 x 1440 │ 28                      │                │
# │ SC-02K            │ Samsung    │ SC-02K                              │ PHYSICAL │ 2220 x 1080 │ 28                      │                │
# │ SCV33             │ Samsung    │ SCV33                               │ PHYSICAL │ 2560 x 1440 │ 26                      │                │
# │ SH-01L            │ SHARP      │ SH-01L                              │ PHYSICAL │ 2160 x 1080 │ 28                      │                │
# │ SH-03K            │ SHARP      │ SH-03K                              │ PHYSICAL │ 3040 x 1440 │ 28                      │                │
# │ TB-8504F          │ Lenovo     │ Lenovo TB-8504F                     │ PHYSICAL │  800 x 1280 │ 27                      │                │
# │ a10               │ Samsung    │ SM-A105FN                           │ PHYSICAL │  720 x 1520 │ 29                      │                │
# │ blueline          │ Google     │ Pixel 3                             │ PHYSICAL │ 2160 x 1080 │ 28                      │ default        │
# │ c5proltechn       │ Samsung    │ SM-C5010                            │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ cactus            │ Xiaomi     │ Redmi 6A                            │ PHYSICAL │ 1440 x 720  │ 27                      │                │
# │ chiron            │ Xiaomi     │ Mi MIX 2                            │ PHYSICAL │ 2160 x 1080 │ 26                      │                │
# │ crownqlteue       │ Samsung    │ SM-N960U1                           │ PHYSICAL │ 1080 x 2220 │ 27                      │                │
# │ cruiserlteatt     │ Samsung    │ SM-G892A                            │ PHYSICAL │ 1080 x 2220 │ 26                      │                │
# │ dipper            │ Xiaomi     │ MI 8                                │ PHYSICAL │ 2248 x 1080 │ 28                      │                │
# │ dreamlte          │ Samsung    │ SM-G950F                            │ PHYSICAL │ 1080 x 2220 │ 28                      │                │
# │ dreamqlteue       │ Samsung    │ SM-G950U1                           │ PHYSICAL │ 1080 x 2220 │ 26                      │                │
# │ f2q               │ Samsung    │ SM-F916U1                           │ PHYSICAL │ 2208 x 1768 │ 30                      │                │
# │ flame             │ Google     │ Pixel 4                             │ PHYSICAL │ 2280 x 1080 │ 29,30                   │ deprecated=30  │
# │ flo               │ Asus       │ Nexus 7                             │ PHYSICAL │ 1200 x 1920 │ 19,21                   │                │
# │ grandppltedx      │ Samsung    │ SM-G532G                            │ PHYSICAL │  540 x 960  │ 23                      │                │
# │ greatlteks        │ Samsung    │ SM-N950N                            │ PHYSICAL │ 1080 x 2220 │ 28                      │                │
# │ griffin           │ Motorola   │ XT1650                              │ PHYSICAL │ 1440 x 2560 │ 24                      │                │
# │ gts3lltevzw       │ Samsung    │ SM-T827V                            │ PHYSICAL │ 1536 x 2048 │ 28                      │                │
# │ gts4lltevzw       │ Samsung    │ SM-T837V                            │ PHYSICAL │ 2560 x 1600 │ 28                      │                │
# │ gts4lvwifi        │ Samsung    │ SM-T720                             │ PHYSICAL │ 1600 x 2560 │ 28                      │                │
# │ h1                │ LG         │ LG-H831                             │ PHYSICAL │ 1440 x 2560 │ 26                      │ deprecated=26  │
# │ hammerhead        │ LG         │ Nexus 5                             │ PHYSICAL │ 1920 x 1080 │ 23                      │                │
# │ harpia            │ Motorola   │ Moto G Play                         │ PHYSICAL │ 1280 x 720  │ 23                      │                │
# │ hero2qlteatt      │ Samsung    │ SAMSUNG-SM-G935A                    │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ hero2qltespr      │ Samsung    │ SM-G935P                            │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ hero2qltetmo      │ Samsung    │ SM-G935T                            │ PHYSICAL │ 1920 x 1080 │ 26                      │                │
# │ heroqlteaio       │ Samsung    │ SAMSUNG-SM-G930AZ                   │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ heroqltemtr       │ Samsung    │ SM-G930T1                           │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ heroqltetfnvzw    │ Samsung    │ SM-G930VL                           │ PHYSICAL │ 1440 x 2560 │ 26                      │                │
# │ heroqlteue        │ Samsung    │ SM-G930U                            │ PHYSICAL │ 1920 x 1080 │ 26                      │                │
# │ heroqlteusc       │ Samsung    │ SM-G930R4                           │ PHYSICAL │ 1080 x 1920 │ 26                      │                │
# │ heroqltevzw       │ Samsung    │ SM-G930V                            │ PHYSICAL │ 1440 x 2560 │ 26                      │                │
# │ htc_ocmdugl       │ HTC        │ HTC U11 plus                        │ PHYSICAL │ 1440 x 2880 │ 26                      │                │
# │ htc_pmeuhl        │ HTC        │ HTC 10                              │ PHYSICAL │ 1440 x 2560 │ 26                      │                │
# │ hwALE-H           │ Huawei     │ ALE-L23                             │ PHYSICAL │ 1280 x 720  │ 21                      │                │
# │ j7popltevzw       │ Samsung    │ SM-J727V                            │ PHYSICAL │ 1280 x 720  │ 27                      │                │
# │ joan              │ LG         │ LG-H932                             │ PHYSICAL │ 1440 x 2880 │ 26                      │                │
# │ judypn            │ LG         │ LM-V405                             │ PHYSICAL │ 3120 x 1440 │ 28                      │                │
# │ lt02wifi          │ Samsung    │ SM-T210                             │ PHYSICAL │  600 x 1024 │ 19                      │                │
# │ lucye             │ LG         │ VS988                               │ PHYSICAL │ 1440 x 2880 │ 24                      │ deprecated=24  │
# │ lv0               │ LG         │ LG-AS110                            │ PHYSICAL │  854 x 480  │ 23                      │                │
# │ m0                │ Samsung    │ GT-I9300                            │ PHYSICAL │ 1280 x 720  │ 18                      │ deprecated=18  │
# │ pettyl            │ Motorola   │ moto e5 play                        │ PHYSICAL │  960 x 480  │ 27                      │                │
# │ phoenix_sprout    │ LG         │ LM-Q910                             │ PHYSICAL │ 3120 x 1440 │ 28                      │                │
# │ redfin            │ Google     │ Pixel 5e                            │ PHYSICAL │ 2340 x 1080 │ 30                      │                │
# │ sailfish          │ Google     │ Pixel                               │ PHYSICAL │  640 x 480  │ 25                      │                │
# │ star2lte          │ Samsung    │ SM-G965F                            │ PHYSICAL │ 1080 x 2220 │ 28                      │ deprecated=28  │
# │ star2lteks        │ Samsung    │ SM-G965N                            │ PHYSICAL │ 1080 x 2220 │ 28                      │                │
# │ starlte           │ Samsung    │ SM-G960F                            │ PHYSICAL │ 1080 x 2220 │ 26                      │ deprecated=26  │
# │ starlteks         │ Samsung    │ SM-G960N                            │ PHYSICAL │ 1080 x 2220 │ 28                      │ deprecated=28  │
# │ starqltechn       │ Samsung    │ SM-G9600                            │ PHYSICAL │ 1080 x 2220 │ 26                      │                │
# │ starqlteue        │ Samsung    │ SM-G960U1                           │ PHYSICAL │ 1080 x 2220 │ 26                      │                │
# │ tulip             │ Xiaomi     │ Redmi Note 6 Pro                    │ PHYSICAL │ 2280 x 1080 │ 28                      │ deprecated=28  │
# │ walleye           │ Google     │ Pixel 2                             │ PHYSICAL │ 1920 x 1080 │ 27                      │                │
# │ x1q               │ Samsung    │ SM-G981U1                           │ PHYSICAL │ 3200 x 1440 │ 29                      │                │
# └───────────────────┴────────────┴─────────────────────────────────────┴──────────┴─────────────┴─────────────────────────┴────────────────┘
