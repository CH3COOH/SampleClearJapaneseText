# SampleClearJapaneseText

## About the issue with text not disappearing during Japanese input in SwiftUI TextField

This repository is a sample project to confirm the issue where text does not disappear during Japanese input in SwiftUI TextField.

For more details, please read the article I wrote: "[The issue and solution for the clear button not working in TextField during Japanese input in SwiftUI](https://dev.classmethod.jp/articles/swiftui-japanese-input-textfield-clear-button-issue/)".

* Solution 1: Remove focus and then re-focus
* Solution 2: Use TextEditor instead of TextField
* Solution 3: Set `UITextField.appearance().clearButtonMode = .always`
* Solution 4: Delete one character first, then delete the text in the next event loop

## SwiftUIのTextFieldで日本語入力時にテキストが消えない問題について

このリポジトリは、SwiftUIのTextFieldで日本語入力時にテキストが消えない問題についての確認用のサンプルプロジェクトである。

詳しくは「[SwiftUIで日本語入力時にTextFieldのクリアボタンが機能しない問題と解決策](https://dev.classmethod.jp/articles/swiftui-japanese-input-textfield-clear-button-issue/)」に書いたので読んで欲しい。

* 解決案1：フォーカスを外してフォーカスを付け直す
* 解決案2：TextFieldを使わずにTextEditorを使う
* 解決案3：`UITextField.appearance().clearButtonMode = .always` を設定する
* 解決案4：1文字消してから次のイベントループでテキストを削除する

## Screenshots

### Solution 1: Remove focus and then re-focus

https://github.com/user-attachments/assets/c773418c-7f94-4ba2-89dc-f7f0acc6cbff

### Solution 2: Use TextEditor instead of TextField

https://github.com/user-attachments/assets/f7d6d5cd-e6e3-434e-92c2-ad60b204a03c

### Solution 3: Set `UITextField.appearance().clearButtonMode = .always`

https://github.com/user-attachments/assets/37762ce6-94bc-42ac-83de-195db114407b

### Solution 4: Delete one character first, then delete the text in the next event loop

https://github.com/user-attachments/assets/7732dee1-9f21-4a52-a300-e604222327e7

