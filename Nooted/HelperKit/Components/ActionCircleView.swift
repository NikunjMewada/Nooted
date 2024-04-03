//
//  ActionCircleView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 20/03/24.
//

import SwiftUI

enum ButtonType: String {
    case next = "arrow.right"
    case add = "plus"
    case save = "checkmark"
    case delete = "trash"
}

struct ActionCircleView: View {
    let type: ButtonType

    var body: some View {
        ZStack {
            Circle()
                .fill( AppColors.primary)

            Image(systemName: type.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(AppColors.background)
        }
        .frame(width: 75)
    }
}
