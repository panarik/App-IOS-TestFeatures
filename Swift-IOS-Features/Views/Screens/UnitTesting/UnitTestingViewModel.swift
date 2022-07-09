import Foundation
import SwiftUI
import Combine


protocol MockDataProtocol {
    
    func downloadItemsWithEscaping( completion: @escaping (_ items: [String]) -> ())
    
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error>
    
}

class NewMockDataService: MockDataProtocol {
    
    var items:[String]
    
    init(items: [String]?) {
        self.items = items ?? ["one", "two", "three"]
    }
    
    
    func downloadItemsWithEscaping( completion: @escaping (_ items: [String]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
    }
    
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItems in
                if publishedItems.isEmpty {
                    throw URLError(.badServerResponse)
                } else {
                    return publishedItems
                }
            })
            .eraseToAnyPublisher()
    }
    
}

class UnitTestingViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem:String?
    var dataService:MockDataProtocol
    
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
        dataService.downloadItemsWithEscaping { returnedItems in
            self.dataArray = returnedItems
        }
    }
    
}
