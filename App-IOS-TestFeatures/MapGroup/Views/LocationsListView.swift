import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: MapViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.updateLocation(location: location)
                } label: {
                    locationItem(location: location)
                }
                
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
    
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(MapViewModel())
    }
}

extension LocationsListView {
    
    private func locationItem(location: Location) -> some View {
        
        HStack {
            Image(location.imageNames.first ?? "loading")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
    
}
