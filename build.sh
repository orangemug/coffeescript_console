BUILD_DIR=build_v0.2.0
mkdir i-p $BUILD_DIR
rsync -vaz --delete . $BUILD_DIR --exclude 'vendor/coffee-script' --exclude '.git' --exclude '*.crx' --exclude '*.pem'

google-chrome --enable-experimental-extension-apis --pack-extension=$BUILD_DIR
rm -r $BUILD_DIR
rmdir i-p
