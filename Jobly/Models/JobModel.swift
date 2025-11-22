//
//  JobModel.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import Foundation
struct Job: Codable, Identifiable {
    let id: String
    let techPark: String
    let companyName: String
    let jobRole: String
    let deadline: String?
    let jobLink: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case techPark, companyName, jobRole, deadline, jobLink, status
    }
    
    var displayRole: String {
        jobRole.replacingOccurrences(of: #"\d{2}-\d{2}-\d{4}"#, with: "", options: .regularExpression)
            .trimmingCharacters(in: .whitespaces)
    }
    
    var datePosted: String {
        let pattern = #"\d{2}-\d{2}-\d{4}"#
        if let range = jobRole.range(of: pattern, options: .regularExpression) {
            return String(jobRole[range])
        }
        return "Recent"
    }
}
