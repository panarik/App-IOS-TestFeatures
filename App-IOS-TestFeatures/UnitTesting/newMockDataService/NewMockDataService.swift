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
                guard !publishedItems.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItems
            })
            .eraseToAnyPublisher()
    }

}
