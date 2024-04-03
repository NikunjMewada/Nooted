//
//  HomeView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 25/03/24.
//

import SwiftUI

struct HomeView: View {
    @State private var openSheet = false
    @State private var shouldShowGrid = false
    @State private var items = CoreDataHandler.shared.getNotesItem()

    var body: some View {
        VStack {
            headerView()

            Spacer()

            if shouldShowGrid {
                GroupView(items: items)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
        .onReceive(CoreDataHandler.shared.publisher, perform: { _ in
            items = CoreDataHandler.shared.getNotesItem()
        })
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                shouldShowGrid = true
            }
        }
    }
    
    private func headerView() -> some View {
        HStack {
            Text(AppTexts.Home.homeTitle)
                .font(AppFonts.title())
                .foregroundColor(AppColors.primary)
                .padding([.top, .leading], 20)
                .multilineTextAlignment(.leading)
                .loadUp(0.5)
            
            Spacer()
            
            ActionCircleView(type: .add)
                .sheet(isPresented: $openSheet, content: {
                    NotesView(text: "", notes: "", index: 0) {
                        items = CoreDataHandler.shared.getNotesItem()
                        openSheet.toggle()
                    }
                })
                .padding(.trailing, 20)
                .onTapGesture {
                    openSheet.toggle()
                }
                .easeIn(1.5)
            
        }
    }
}
