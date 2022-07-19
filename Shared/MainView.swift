import SwiftUI

// Test comment

class MainViewModel {
    
    var landmarks:[Landmark]

    init() {
        self.landmarks = [Landmark]()
        self.landmarks.append(Landmark(id: 1, name: "Shopping", imageName: "mobile_shop_shoping"))
        self.landmarks.append(Landmark(id: 2, name: "List Example", imageName: "list_view_list"))
        self.landmarks.append(Landmark(id: 3, name: "UI bugs", imageName: "bug_ui_example_logo"))
        self.landmarks.append(Landmark(id: 4, name: "Themes", imageName: "picture_effects_plash_smoke"))
    }
}

struct MainView: View {
    
    @State var isLinkActive = false
    private var vm:MainViewModel = MainViewModel()
    
    var body: some View {
        
        //List with items
        NavigationView {
            List(vm.landmarks) { landmark in
                NavigationLink {
                    switch landmark.name {
                    case "List Example" : ListView()
                    case "Themes" : ProtocolView()
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

struct Landmark: Identifiable {
    
    var id: Int
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
}

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 80, height: 80.0)
            
            Text(landmark.name)
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
