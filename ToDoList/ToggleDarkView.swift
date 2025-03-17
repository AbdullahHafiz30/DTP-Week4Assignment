//
//  ToggleDarkView.swift
//  ToDoList
//
//  Created by Abdullah Hafiz on 14/09/1446 AH.
//

import SwiftUI

public struct ToggleView: View {
    @Binding var isDarkMode: Bool
    public var body: some View {
        Toggle(isOn: $isDarkMode){
            Text(isDarkMode ? "Light Mode" : "Dark Mode")
                .font(.custom("Poppins-Medium", size: 16))
        }.toggleStyle(.switch)
            .padding()
    }
}

#Preview {
    ToggleView(isDarkMode: .constant(false))
}
