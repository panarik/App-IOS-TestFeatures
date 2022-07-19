import SwiftUI
import Combine

struct PostsModel: Identifiable, Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

// Protocol for use both DataService versions.
protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel], Error>
}

// Represented getting data from database or repository.
class ProductionDataService: DataServiceProtocol {

    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data }) // responce data
            .decode(type: [PostsModel].self, decoder: JSONDecoder()) // decode into objects
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// Represented another type of data injection.
class MockDataService: DataServiceProtocol {
    
    let fakeData:[PostsModel] = [
        PostsModel(userId: 1, id: 0, title: "Title 1", body: "Body 1"),
        PostsModel(userId: 1, id: 1, title: "Title 2", body: "Body 2"),
        PostsModel(userId: 1, id: 2, title: "Title 3", body: "Body 3")
    ]
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        Just(fakeData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = [] // stored posts
    var cancelabbles = Set<AnyCancellable>()
    let dataService: DataServiceProtocol // create variable with dependency from protocol
    
    init(dataService: DataServiceProtocol) { // put dependency here
        self.dataService = dataService // inject dependency class
        loadPosts(dataService)
    }
    
    private func loadPosts(_ dataService:DataServiceProtocol) {
        dataService.getData()
            .sink{ _ in
                
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancelabbles)
    }
    
}

struct DependencyInjectionView: View {
    
    @StateObject private var vm: DependencyInjectionModel // stored dependency injection class
    
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyInjectionModel(dataService: dataService)) // init @StateObject variable from dependency injection
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjection_Previews: PreviewProvider {
    
//    static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static let dataService = MockDataService()
    
    static var previews: some View {
        DependencyInjectionView(dataService: dataService)
    }
}
