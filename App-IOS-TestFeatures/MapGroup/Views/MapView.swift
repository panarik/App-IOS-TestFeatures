import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var vm: MapViewModel = MapViewModel()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    Button {
                        vm.updateLocation(location: location)
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .accessibilityIdentifier("MapPin image info.circle.fill")
                    }
                    .accessibilityIdentifier("MapPin " + location.name)
                    
                }
            })
                .ignoresSafeArea()
                .accessibilityIdentifier("Map background")
            
            VStack {
                headers
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    
                Spacer()
                description
                    .padding()
            }
        }
        // Creates the environment object.
        .environmentObject(vm)
    }
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension MapView {
    
    private var headers: some View {
        VStack {
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.locationsListOnScreen ? 180 : 0))
                    }
            }
            .accessibilityIdentifier("Title")

            if vm.locationsListOnScreen {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 15)
    }
    
    private var description: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation.id == location.id {
                    LocationsPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 20)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                        
                }
                
            }
        }
    }
    
}
