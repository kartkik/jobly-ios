//
//  JobListView.swift
//  Jobly
//
//  Created by 12345 on 22/11/2025.
//

import SwiftUI

import SwiftUI

struct JobListView: View {
    @StateObject private var vm = JobListViewModel()
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "667eea"), Color(hex: "764ba2")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    headerView
                    searchBar
                    filterChips
                    
                    if vm.isLoading {
                        loadingView
                    } else if let error = vm.errorMessage {
                        errorView(error)
                    } else {
                        jobsList
                            .frame(maxHeight: .infinity)   
                    }
                }
            }
            .task { await vm.fetchJobs() }
            .refreshable { await vm.fetchJobs() }
            .sheet(item: $vm.selectedJob) { job in
                JobDetailSheet(job: job)
            }
            .onChange(of: vm.searchText) { _ in vm.applyFilters() }
            .onChange(of: vm.selectedFilter) { _ in vm.applyFilters() }
        }
    }
}

extension JobListView {
    var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Find Your")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white.opacity(0.9))
            
            Text("Dream Job")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
            
            Text("\(vm.filteredJobs.count) opportunities available")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.top, 20)
        .padding(.bottom, 24)
    }
}




extension JobListView {
    var searchBar: some View {
        HStack(spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search jobs or companies...", text: $vm.searchText)
                    .font(.system(size: 16))

                if !vm.searchText.isEmpty {
                    Button(action: { vm.searchText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(16)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
    }
}



extension JobListView {
    var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(JobListViewModel.JobFilter.allCases, id: \.self) { filter in
                    FilterChip(
                        title: filter.rawValue,
                        isSelected: vm.selectedFilter == filter
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            vm.selectedFilter = filter
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.bottom, 16)
    }
}


extension JobListView {
    var jobsList: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(Array(vm.filteredJobs.enumerated()), id: \.element.id) { index, job in
                    
                    JobCard(job: job)
                        .onTapGesture {
                            vm.selectedJob = job
                        }
                        .transition(.asymmetric(
                            insertion: .scale.combined(with: .opacity),
                            removal: .opacity
                        ))
                        .animation(
                            .spring(response: 0.4, dampingFraction: 0.8)
                            .delay(Double(index) * 0.05),
                            value: vm.filteredJobs.count
                        )
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}


extension JobListView {
    var loadingView: some View {
        VStack(spacing: 20) {
            ProgressView()
                .scaleEffect(1.5)
                .tint(.white)
            
            Text("Loading amazing opportunities...")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension JobListView {
    func errorView(_ error: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.white.opacity(0.8))
            
            Text("Oops! Something went wrong")
                .font(.headline)
                .foregroundColor(.white)
            
            Text(error)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Try Again") {
                Task { await vm.fetchJobs() }
            }
            .font(.headline)
            .foregroundColor(Color(hex: "667eea"))
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(12)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
