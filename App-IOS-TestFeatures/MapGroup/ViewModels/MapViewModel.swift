import Foundation

class MapViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        self.locations = LocationsDataService.locations
    }
    
}
