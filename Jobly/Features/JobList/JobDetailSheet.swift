//
//  JobDetailView.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import SwiftUI


struct JobDetailSheet: View {
    let job: Job
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text(job.companyName)
                        .font(.title3.bold())
                        .foregroundColor(Color(hex: "667eea"))
                    
                    Text(job.displayRole)
                        .font(.title.bold())
                    
                    Divider()
                    
                    DetailRow(icon: "mappin.circle.fill", title: "Location", value: job.techPark)
                    DetailRow(icon: "calendar", title: "Posted", value: job.datePosted)
                    DetailRow(icon: "clock.fill", title: "Status", value: job.status.capitalized)
                    
                    Divider()
                    
                    Link(destination: URL(string: job.jobLink)!) {
                        HStack {
                            Text("Apply Now")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "667eea"), Color(hex: "764ba2")],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                    }
                }
                .padding(24)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

