import SwiftUI

class MainViewModel {

    var landmarks: [Landmark]

    init() {
        landmarks = [Landmark]()
        landmarks.append(Landmark(id: 1, name: "Shopping", imageName: "mobile_shop_shoping"))
        landmarks.append(Landmark(id: 2, name: "List Example", imageName: "list_view_list"))
        landmarks.append(Landmark(id: 3, name: "Music player", imageName: "playing_audio_band"))
        landmarks.append(Landmark(id: 4, name: "UI bugs", imageName: "bug_ui_example_logo"))
        landmarks.append(Landmark(id: 5, name: "Themes", imageName: "picture_effects_plash_smoke"))
        landmarks.append(Landmark(id: 6, name: "Map", imageName: "map_logo"))
    }
}

struct MainView: View {

    @State var isLinkActive = false
    private var vm: MainViewModel = MainViewModel()

    var body: some View {

        //List with items
        NavigationView {
            List(vm.landmarks) { landmark in
                NavigationLink {
                    switch landmark.name {
                    case "List Example": ListView()
                    case "Themes": ProtocolView()
                    case  "Music player": PlayerView()
                    case "Map": MapView()
                    default: Text(landmark.name + " screen does not exist")
                            .font(.title)
                    }
                }
                label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .accessibilityIdentifier("mainMenuList")
            .accessibilityLabel("Main menu")
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
                    .dynamicTypeSize(.xxxLarge)
            Spacer()
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
