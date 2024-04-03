//
//  NoteItemView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 01/04/24.
//

import SwiftUI

struct NoteItemView: View {
    let name: String
    let note: String
    let index: Int
    @State private var openSheet = false

    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .frame(height: 1.5)
                .background(AppColors.primary)
                .easeIn(TimeInterval(index + 1))
            
            Text(name)
                .font(AppFonts.regular(20))
                .lineLimit(2)

            Text(note)
                .font(AppFonts.thin(20))
                .lineLimit(5)
        }
        .sheet(isPresented: $openSheet, content: {
            NotesView(text: name, notes: note, index: index) {
                openSheet.toggle()
            }
        })
        .onTapGesture {
            openSheet.toggle()
        }
        .padding([.leading, .trailing, .bottom], 20)
        .foregroundColor(AppColors.primary)
        .loadUp(TimeInterval(index))
    }
}
