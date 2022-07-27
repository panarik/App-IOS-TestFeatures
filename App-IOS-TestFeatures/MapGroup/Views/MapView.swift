import SwiftUI

struct MapView: View {
    
    @StateObject var vm: MapViewModel = MapViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.locations) {Text($0.name)}
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
