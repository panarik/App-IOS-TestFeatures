import Foundation
import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    
    // All locations.
    @Published var locations: [Location]
    
    // Current location.
    @Published var mapLocation: Location {
        didSet {
            updateRegion(location: mapLocation) // do this after updating var 'mapLocation'.
        }
    }
    
    // Current region map on the screen.
    @Published var mapRegion: MKCoordinateRegion
    
    // Show locations list on map.
    @Published var locationsListOnScreen: Bool = false
    
    // Map scale.
    let mapScale = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        //Make first region for map.
        mapRegion = MKCoordinateRegion(center: locations.first!.coordinates, span: mapScale)
    }
    
    /**
     Updating current map location.
     */
    func updateLocation(location: Location) {
        withAnimation(.easeOut) {
            self.mapLocation = location
            self.locationsListOnScreen = false // close location list
        }
        
    }
    
    /**
     Updating map region to current location.
     `location` - current location
     */
    private func updateRegion(location: Location) {
        self.mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapScale)
    }
    
    /**
     Toggle map showing.
     */
    func toggleLocationsList() {
        withAnimation(.easeOut) {
            locationsListOnScreen.toggle()
        }
    }
    
}
