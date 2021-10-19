output="../build/ios_integ"
product="build/ios_integ/Build/Products"
dev_target="14.7"

# Pass --simulator if building for the simulator.
flutter build ios integration_test/app_test.dart --release

pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath $output -sdk iphoneos build-for-testing
popd

pushd $product
zip -r "ios_tests.zip" "Release-iphoneos" "Runner_iphoneos$dev_target-arm64.xctestrun"
popd

 

gcloud firebase test ios run --test "build/ios_integ/Build/Products/ios_tests.zip" \
  --device model=iphone11pro,version=$dev_target,locale=en_GB,orientation=portrait \
  --timeout 3m \
  --results-bucket=gs://integration_results_mjcoffee \
  --results-dir=tests/firebase

# # > gcloud firebase test ios models list
# ┌─────────────┬───────────────────────┬───────────────────────────────┬──────────────────────────┐
# │   MODEL_ID  │          NAME         │         OS_VERSION_IDS        │           TAGS           │
# ├─────────────┼───────────────────────┼───────────────────────────────┼──────────────────────────┤
# │ ipad5       │ iPad (5th generation) │ 14.1                          │ deprecated=14.1          │
# │ ipadmini4   │ iPad mini 4           │ 14.1                          │ deprecated=14.1          │
# │ iphone11    │ iPhone 11             │ 13.3,13.6                     │                          │
# │ iphone11pro │ iPhone 11 Pro         │ 13.3,14.1,14.7                │ deprecated=14.1          │
# │ iphone7plus │ iPhone 7 Plus         │ 14.1                          │ deprecated=14.1          │
# │ iphone8     │ iPhone 8              │ 11.4,12.0,12.4,13.6,14.1,14.7 │ deprecated=14.1, default │
# │ iphone8plus │ iPhone 8 Plus         │ 12.0                          │                          │
# │ iphonexr    │ iPhone XR             │ 12.4,13.2                     │                          │
# │ iphonexsmax │ iPhone XS Max         │ 12.1                          │                          │
# └─────────────┴───────────────────────┴───────────────────────────────┴──────────────────────────┘