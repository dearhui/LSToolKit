# LSToolKit

目前開發 iOS 常使用到的元件

### LSQRCodeView
用來產生各種條碼
```swift
@State private var codeString = "12345678"

LSQRCodeView(qrString: $codeString, type: .barcode128)
    .frame(width: 200, height: 50)

LSQRCodeView(qrString: $codeString, type: .qrCode)
    .frame(width: 200, height: 200)
```
![alt text](https://github.com/dearhui/LSToolKit/blob/14a7b1acbcd446ced8c781a219e3d5367ff5d261/images/LSQRCodeViewScreenShot.png?raw=true)

### LXCapsuleButtonModifier
橢圓型按鈕
```swift
VStack {
    Text("Hello, World!")
        .modifier(LXCapsuleButtonModifier(color: .accentColor, boder: true))
    Text("Hello, World!")
        .modifier(LXCapsuleButtonModifier(color: .red, boder: false))
    Text("Hello, World!")
        .modifier(LXCapsuleButtonModifier(color: .red, boder: true))
    Text("Hello, World!")
        .modifier(LXCapsuleButtonModifier(color: .green,
                                          size: 20,
                                          weight: .black,
                                          boder: true,
                                          boderWidth: 2,
                                          vPadding: 10,
                                          hPadding: 50))
}
```
![alt text](https://github.com/dearhui/LSToolKit/blob/3453d37705084fd8020d7a20e4939a28b28bea75/images/capsulebutton.png?raw=true)
