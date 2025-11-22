//
//  JobCard.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import SwiftUI

struct JobCard: View {
    let job: Job
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "building.2.fill")
                            .font(.caption)
                            .foregroundColor(Color(hex: "667eea"))
                        
                        Text(job.companyName)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "667eea"))
                    }
                    
                    Text(job.displayRole)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray.opacity(0.5))
            }
            
            Divider()
            
            HStack(spacing: 16) {
                Label(job.techPark, systemImage: "mappin.circle.fill")
                Label(job.datePosted, systemImage: "calendar")
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.08), radius: 15, y: 8)
        )
        .scaleEffect(isPressed ? 0.96 : 1.0)
        .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}
