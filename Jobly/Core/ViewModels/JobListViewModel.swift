import SwiftUI

@MainActor
class JobListViewModel: ObservableObject {
    
    @Published var jobs: [Job] = []
    @Published var filteredJobs: [Job] = []
    
    @Published var searchText: String = ""
    @Published var selectedFilter: JobFilter = .all
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var selectedJob: Job?
    
    private let jobService = JobService()
    
    enum JobFilter: String, CaseIterable {
        case all = "All Jobs"
        case developer = "Developer"
        case intern = "Intern"
        case business = "Business"
        case sales = "Sales"
    }
    
    init() {
        Task {
            await fetchJobs()
        }
    }
    
    func fetchJobs() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let data = try await jobService.fetchJobs()
            self.jobs = data
            applyFilters()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func applyFilters() {
        var result = jobs
        
        if !searchText.isEmpty {
            result = result.filter {
                $0.displayRole.localizedCaseInsensitiveContains(searchText) ||
                $0.companyName.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        if selectedFilter != .all {
            result = result.filter {
                $0.displayRole.localizedCaseInsensitiveContains(selectedFilter.rawValue)
            }
        }
        
        filteredJobs = result
    }
}
