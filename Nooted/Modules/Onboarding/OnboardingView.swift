//
//  OnboardingView.swift
//  Nooted
//
//  Created by Nikunj Mewada on 20/03/24.
//

import SwiftUI

struct OnboardingView: View {
    let callBack: () -> Void

    var body: some View {
        VStack {
            setupHeader()

            Spacer()
            
            setupButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
    }

    private func setupHeader() -> some View {
        VStack {
            Text(AppTexts.appName)
                .font(AppFonts.title())
                .foregroundColor(AppColors.primary)
                .padding(.top, 50)
                .padding([.leading, .trailing], 30)
                .loadUp()

            Text(AppTexts.Onboarding.title)
                .font(AppFonts.subtitle())
                .foregroundColor(AppColors.primary)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding([.leading, .trailing], 30)
                .loadUp(1.5)
        }
    }
    
    private func setupButton() -> some View {
        VStack(spacing: 20) {
            Text(AppTexts.Onboarding.subtitle)
                .font(AppFonts.thin(25))
                .foregroundColor(AppColors.primary)

            ActionCircleView(type: .next)
                .onTapGesture {
                    callBack()
                }
        }
        .padding(.bottom, 50)
        .easeIn(2.5)
    }
}
