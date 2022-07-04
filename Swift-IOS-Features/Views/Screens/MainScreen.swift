import SwiftUI

struct MainScreen: View {
    
    @State var isLinkActive = false
    
    var body: some View {
        
        //List with items
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    switch landmark.name {
                    case "List Example" : ListScreen()
                    case "Themes" : ProtocolScreen()
                    default : Text(landmark.name + " screen does not exist")
                            .font(.title)
                    }
                }
            label: {
                LandmarkRow(landmark: landmark)
            }
            }
            .navigationTitle("Main menu")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
