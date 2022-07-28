import Foundation
import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    
    // All locations.
    @Published var locations: [Location]
    
    // Current location.
    @Published var mapLocation: Location {
        
        // do this after updating var 'mapLocation'.
        didSet {
            updateRegion(location: mapLocation)
        }
    }
    
    // Current region map on the screen.
    @Published var mapRegion: MKCoordinateRegion
    
    // Map scale.
    let mapScale = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        //Make first region for map.
        mapRegion = MKCoordinateRegion(center: locations.first!.coordinates, span: mapScale)
    }
    
    /**
     Updating map region to current location.
     `location` - current location
     */
    func updateRegion(location: Location) {
        withAnimation {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapScale)
        }
    }
    
}
