//
//  TextEditorWithPlaceholder.swift
//  TextEditorWithPlaceholder
//
//  Created by 平岡修 on 2022/06/01.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
    
    @FocusState private var focusedField: Field?
    
    enum Field {
        case textEditor
        case placeholder
    }
    
    @Binding var text: String
    private let placeholderText: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholderText = placeholder
    }
    
    var body: some View {
        ZStack {
            
            // Show the placeholder if the text is empty
            if text.isEmpty {
                
                ZStack {
                    Rectangle()
                        .fill(Color(uiColor: .systemBackground))
                        .onTapGesture {
                            focusedField = .placeholder
                        }
                    
                    VStack {
                        HStack {
                            TextField(placeholderText, text: $text)
                                .focused($focusedField, equals: .placeholder)
                                .onAppear {
                                    focusedField = .placeholder
                                }
                                
                            Spacer()
                        }
                        .padding(.leading, 6)
                        .padding(.top, 8)
                        
                        Spacer()
                    }
                }

                // Show the text editor if the text is not empty
            } else {
                TextEditor(text: $text)
                    .focused($focusedField, equals: .textEditor)
                    .onAppear {
                        focusedField = .textEditor
                    }
            }
        }
    }
}

struct TextEditorWithPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorWithPlaceholder("タイトル", text: .constant(""))
    }
}
