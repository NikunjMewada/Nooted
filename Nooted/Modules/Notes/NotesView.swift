//
//  NotesView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 25/03/24.
//

import SwiftUI

struct NotesView: View {
    let text: String
    let notes: String
    let index: Int
    let callBack: () -> Void
    
    init(text: String, notes: String, index: Int, callBack: @escaping () -> Void) {
        self.text = text
        self.notes = notes
        self.index = index
        self.callBack = callBack
    }

    @State private var title = ""
    @State private var note = ""
    @State private var isUpdating = false

    var body: some View {
        VStack {
            setupTextfields()

            Spacer()

            setupButtons()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear {
            handleAppear()
        }
    }
    
    private func handleAppear() {
        guard !(text.isEmpty) else { return }
        UIApplication.shared.addTapGestureRecognizer()
        isUpdating = true
        title = text
        note = notes
    }

    private func setupTextfields() -> some View {
        VStack(spacing: 20) {
            TextField(AppTexts.Notes.titlePlaceholder, text: $title, axis: .vertical)
                .font(AppFonts.regular(30))
                .loadUp(0.2)

            TextField(AppTexts.Notes.notePlaceholder, text: $note, axis: .vertical)
                .font(AppFonts.thin(20))
                .loadUp(0.5)
        }
        .foregroundColor(AppColors.primary)
        .accentColor(AppColors.primary)
        .multilineTextAlignment(.leading)
        .autocorrectionDisabled()
        .padding(.all, 20)
    }
    
    private func setupButtons() -> some View {
        HStack(alignment: .center, spacing: 40) {
            saveButton()

            if !(text.isEmpty) {
                deleteButton()
            }
        }
        .easeIn(1.5)
    }

    private func saveButton() -> some View {
        ActionCircleView(type: .save)
            .onTapGesture {
                guard !(title.isEmpty) && !(note.isEmpty) else {
                    callBack()
                    return
                }

                if isUpdating {
                    CoreDataHandler.shared.deleteNote(index: index)
                }

                CoreDataHandler.shared.addNote(title: title, note: note)
                dismiss()
            }
    }

    private func deleteButton() -> some View {
        ActionCircleView(type: .delete)
            .onTapGesture {
                CoreDataHandler.shared.deleteNote(index: index)
                dismiss()
            }
    }

    private func dismiss() {
        CoreDataHandler.shared.publisher.send(true)
        callBack()
    }
}
