import Foundation
import SwiftUI

class UnitTestingViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem:String?
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        if !item.isEmpty {
            self.dataArray.append(item)
        }
    }
    
    
    
}
