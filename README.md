# LSToolKit

目前開發 iOS 常使用到的 Library

## LSQRCodeView
用來產生各種條碼
```swift
    @State private var codeString = "12345678"

    LSQRCodeView(qrString: $codeString, type: .barcode128)
        .frame(width: 200, height: 50)

    LSQRCodeView(qrString: $codeString, type: .qrCode)
        .frame(width: 200, height: 200)
```
