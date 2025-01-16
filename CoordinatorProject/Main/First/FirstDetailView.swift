//
//  FirstDetailView.swift
//  CoordinatorProject
//
//  Created by Đoàn Văn Khoan on 15/1/25.
//

import SwiftUI

struct FirstDetailView: View {
    
    
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        VStack {
            Text("First Detail")
            
            TextField("", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

