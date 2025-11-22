//
//  JobService.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import Foundation
import Foundation

class JobService {
    
    func fetchJobs() async throws -> [Job] {
        guard let url = URL(string: "https://fresher-job-finder.vercel.app/api/jobs") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedJobs = try JSONDecoder().decode([Job].self, from: data)
        
        return decodedJobs
    }
}
