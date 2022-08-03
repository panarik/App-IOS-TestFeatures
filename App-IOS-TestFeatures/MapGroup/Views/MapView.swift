import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var vm: MapViewModel = MapViewModel()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack {
                headers
                    .padding()
                
                Spacer()
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
                    .background(Color.gray)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.locationsListOnScreen ? 180 : 0))
                    }
            }

            if vm.locationsListOnScreen {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black, radius: 20, x: 0, y: 15)
    }
    
}
