//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import SwiftUI

struct OnboardingView: View {
    
    
    var doneRequested: () -> ()
    
    var body: some View {
        
        if #available(iOS 14.0, *) {
            TabView {
                ScaledImageView(name: "plant1")
                    .tag(0)
                ScaledImageView(name: "plant2")
                    .tag(1)
                ScaledImageView(name: "plant3")
                    .tag(2)
                
                Button {
                    doneRequested()
                } label: {
                    Text("Done")
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .background(Color.black.ignoresSafeArea(.all))
        } else {
            // Fallback on earlier versions
        }
    }
}


struct ScaledImageView: View {
    
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    OnboardingView() {
        
    }
}
