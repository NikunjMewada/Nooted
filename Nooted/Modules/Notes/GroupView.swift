//
//  GroupView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 25/03/24.
//

import SwiftUI

struct GroupView: View {
    let items: [NotesItem]

    var body: some View {
        ZStack {
            if items.count > 0 {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(items.enumerated()), id: \.element) { index, note in
                            NoteItemView(name: note.title ?? "", note: note.note ?? "", index: index)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                VStack {
                    Spacer()
                    
                    Text(AppTexts.Home.emptyHome)
                        .font(AppFonts.thin(15))
                        .loadUp()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
    }
}
