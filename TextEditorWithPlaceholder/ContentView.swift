//
//  ContentView.swift
//  TextEditorWithPlaceholder
//
//  Created by 平岡修 on 2022/06/01.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var isFocusedTextEditor: Bool
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.yellow)
                .ignoresSafeArea()
            
            VStack {
                
                Text("メモ帳")
                    .font(.title)
                
                TextEditorWithPlaceholder("メモを書く", text: $text)
                    .focused($isFocusedTextEditor)
            }
            .padding()
        }
        .onTapGesture {
            isFocusedTextEditor = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
