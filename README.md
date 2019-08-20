﻿
# @1ziton/react-native-carpture
# Zing二维码识别
## Getting started

`$ npm install @1ziton/react-native-carpture --save`

### Mostly automatic installation

`$ react-native link @1ziton/react-native-carpture`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-carpture` and add `RNcarpture.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNcarpture.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.king.zxing.CapturePackage;` to the imports at the top of the file
  - Add `new CapturePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':@1ziton_react-native-carpture'
project(':@1ziton_react-native-carpture').projectDir = new File(rootProject.projectDir, 	'../node_modules/@1ziton/react-native-carpture/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      implementation project(':@1ziton_react-native-carpture')
  	```


## Usage
```javascript
import {
  NativeModules
} from 'react-native';
const { CaptureMoudle } = NativeModules;
```
CaptureMoudle.openNative(0);//打开摄像头识别
     let eventEmitter = new NativeEventEmitter(CaptureMoudle);
    this.listener = eventEmitter.addListener('code', (params) => {
      if (params) {
        console.log('收到的二维码数据为', params);
      } else {
        ToastUtil.center('扫描失败，请重试');
      }
    });
```