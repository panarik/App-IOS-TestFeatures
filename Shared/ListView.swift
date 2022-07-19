import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name:String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruiteArray: [FruitModel] = []
    @Published var isLoading: Bool = false // loading screen
    
    init() {
        getFruits() // fill list
    }
    
    func getFruits() {
        isLoading = true // start loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruiteArray.append(FruitModel(name: "Banana", count: 8))
            self.fruiteArray.append(FruitModel(name: "Orange", count: 50))
            self.fruiteArray.append(FruitModel(name: "Apple", count: 120))
            self.isLoading = false // end loading
        }
    }
    
    func deleteFruit(index:IndexSet) {
        fruiteArray.remove(atOffsets: index)
    }
}

struct ListView: View {
    
    @StateObject var fruiteViewModel:FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                if fruiteViewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else {
                    ForEach(fruiteViewModel.fruiteArray) { fruit in
                        HStack {
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                        }
                    }
                    .onDelete(perform: fruiteViewModel.deleteFruit(index:))
                }
            }
            .navigationTitle("Fruit list")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: ListDetailsScreen(fruitViewModel: fruiteViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                                .font(.title)
                                        })
                                        .listStyle(GroupedListStyle())
                                        .padding()
            )
        }
    }
}


struct ListDetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.secondary.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruiteArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
