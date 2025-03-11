//
//  ContentView.swift
//  SampleClearJapaneseText
//
//  Created by KENJIWADA on 2025/03/11.
//

import SwiftUI

struct SearchBar: View {
    @Binding private var text: String

    var body: some View {
        HStack {
            TextField("", text: $text, prompt: Text("Search"))
                .textFieldStyle(.plain)
                .padding()
                .foregroundStyle(.white)
            Button {
                text = ""
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
        .padding(.horizontal, 8)
    }

    init(text: Binding<String>) {
        _text = text
    }
}

struct SearchBar1: View {
    @Binding private var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            TextField("", text: $text, prompt: Text("Search"))
                .textFieldStyle(.plain)
                .padding()
                .foregroundStyle(.white)
                .focused($isFocused)
            Button {
                isFocused = false
                text = ""
                // 再フォーカスするために少し遅延させる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isFocused = true
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
        .padding(.horizontal, 8)
    }

    init(text: Binding<String>) {
        _text = text
    }
}

struct SearchBar2: View {
    @Binding private var text: String

    var body: some View {
        HStack {
            TextEditor(text: $text)
                .padding()
                .foregroundStyle(.white)
                .frame(height: 66)
                .scrollContentBackground(.hidden)
                .overlay(
                    Group {
                        if text.isEmpty {
                            Text("Search")
                                .foregroundStyle(.white.opacity(0.5))
                                .padding(.leading, 16)
                                .padding(.top, 24)
                                .allowsHitTesting(false)
                        }
                    },
                    alignment: .topLeading
                )
            Button {
                text = ""
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
        .padding(.horizontal, 8)
    }

    init(text: Binding<String>) {
        _text = text
    }
}

struct SearchBar3: View {
    @Binding private var text: String

    var body: some View {
        HStack {
            TextField("", text: $text, prompt: Text("Search"))
                .textFieldStyle(.plain)
                .padding()
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
        .padding(.horizontal, 8)
        .onAppear {
            UITextField.appearance().clearButtonMode = .always
        }
    }

    init(text: Binding<String>) {
        _text = text
    }
}

struct SearchBar4: View {
    @Binding private var text: String

    var body: some View {
        HStack {
            TextField("", text: $text, prompt: Text("Search"))
                .textFieldStyle(.plain)
                .padding()
                .foregroundStyle(.white)
            Button {
                if !text.isEmpty {
                    let _ = text.removeLast()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.text = ""
                    }
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(.gray))
        .padding(.horizontal, 8)
    }

    init(text: Binding<String>) {
        _text = text
    }
}

struct ContentView: View {
    @State var text = ""
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""

    var body: some View {
        Group {
//            SearchBar(text: $text)
//            SearchBar1(text: $text1)
//            SearchBar2(text: $text2)
//            SearchBar3(text: $text3)
            SearchBar4(text: $text4)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
