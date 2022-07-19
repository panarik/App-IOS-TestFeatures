import Foundation
import SwiftUI
import Combine


class UnitTestingViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem:String?
    var dataService:MockDataProtocol
    var cancellables = Set<AnyCancellable>() // for downloadWithCombine()
    
    init(isPremium: Bool, dataService:MockDataProtocol) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String) {
        if !item.isEmpty {
            self.dataArray.append(item)
        }
    }
    
    func selectItem(item: String) {
        if let x = dataArray.first(where: { $0==item}) {
            self.selectedItem = x
        }
    }
    
    func saveItem(item: String) throws { // for tests with Error assertions.
        
        guard !item.isEmpty else {
            throw DataError.noData
        }
        
        if let x = dataArray.first(where: {$0==item}) {
            print("Save \(x) here!")
        } else {
            throw DataError.itemNotFound
        }
        
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
    
    func downloadWithEscaping() { // For async tests with waiters.
        dataService.downloadItemsWithEscaping { [weak self] returnedItems in
            self?.dataArray = returnedItems
        }
    }
    
    func downloadWithCombine() {
        dataService.downloadItemsWithCombine()
            .sink { _ in
            } receiveValue: { [weak self] returnedItems in
                self?.dataArray = returnedItems
            }
            .store(in: &cancellables)
    }
}


