//
//  FilterChip.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import SwiftUI

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: isSelected ? .semibold : .medium))
                .foregroundColor(isSelected ? .white : .white.opacity(0.8))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Capsule().fill(
                        isSelected
                        ? Color.white.opacity(0.3)
                        : Color.white.opacity(0.15)
                    )
                )
        }
    }
}
