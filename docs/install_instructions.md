# Setting up Android SDK Command Line Tools

## Option 1: Through Android Studio (Recommended)

1. Open Android Studio
2. Navigate to Tools > SDK Manager
3. Select the "SDK Tools" tab
4. Check "Android SDK Command-line Tools (latest)"
5. Click "Apply" to install the selected components

## Option 2: Direct Download (Alternative Method)

If Android Studio is not installed or you prefer a more direct approach:

1. Download the command line tools from: https://developer.android.com/studio#command-tools
2. Extract the downloaded zip file
3. Create an `cmdline-tools` directory inside your Android SDK directory (typically located at `~/Library/Android/sdk/`)
4. Move the extracted files to a subdirectory named `latest` or `tools` inside the `cmdline-tools` directory
5. Add the following to your PATH in `~/.zshrc` or `~/.bash_profile`:

```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

6. Reload your terminal configuration with `source ~/.zshrc` (or applicable profile file)

## After Installation:

Once properly installed, run:

```bash
flutter doctor --android-licenses
```

You should now be able to accept the Android SDK licenses needed for Flutter development.
