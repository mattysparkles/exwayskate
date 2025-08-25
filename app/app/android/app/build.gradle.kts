plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // Align with your AndroidManifest package and MainActivity package
    namespace = "com.sparkles.xray"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    defaultConfig {
        // Your unique app id (must match namespace/manifest package)
        applicationId = "com.sparkles.xray"

        // These come from the Flutter plugin’s versions; OK to keep them
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Required by flutter_local_notifications and some plugins (Java 8+ APIs)
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        // Enable core library desugaring
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildTypes {
        release {
            // For now, use debug signing so `flutter run --release` works
            signingConfig = signingConfigs.getByName("debug")
            // (You can add your release signing config later)
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Needed when coreLibraryDesugaringEnabled = true
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")

    // Kotlin stdlib (often added implicitly; safe to include)
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
}
