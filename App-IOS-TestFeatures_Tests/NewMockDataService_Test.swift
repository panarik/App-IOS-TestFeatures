import XCTest
@testable import App_IOS_TestFeatures
import Combine


class NewMockDataService_Test: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        cancellables.removeAll()
    }

    func test_NewMockDataService_init_shouldSetValuesFromNil() throws {
        // Given
        let itemsNil: [String]? = nil

        // When
        let dataService = NewMockDataService(items: itemsNil)
        
        // Then
        XCTAssertGreaterThan(dataService.items.count, 0)
        XCTAssertFalse(dataService.items.isEmpty)
    }
    
    func test_NewMockDataService_init_shouldSetValuesFromEmpty() throws {
        // Given
        let itemsEmpty: [String]? = []
        
        // When
        let dataService = NewMockDataService(items: itemsEmpty)
        
        // Then
        XCTAssertTrue(dataService.items.isEmpty)
    }
    
    func test_NewMockDataService_init_shouldSetValuesFromFilled() throws {
        // Given
        let itemsFilled: [String]? = ["First", "Second", "Third"]
        
        // When
        let dataService = NewMockDataService(items: itemsFilled)
        
        // Then
        XCTAssertGreaterThan(dataService.items.count, 0)
        XCTAssertFalse(dataService.items.isEmpty)
    }
    
    func test_NewMockDataService_downloadItemsWithEscaping_shouldReturnValues() throws {
        // Given
        let dataService = NewMockDataService(items: nil)
        
        // When
        let expectation = XCTestExpectation()
        var resultItems: [String] = []
        
        dataService.downloadItemsWithEscaping { returnedItems in // only returned items.
            expectation.fulfill()
            resultItems = returnedItems
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(resultItems, dataService.items)
        XCTAssertEqual(resultItems.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_shouldReturnValues() throws {
        // Given
        let dataService = NewMockDataService(items: nil)
        
        // When
        let expectation = XCTestExpectation()
        var resultItems: [String] = []
        dataService.downloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished :
                    expectation.fulfill()
                case .failure :
                    XCTFail("Should be finished.")
                }
            } receiveValue: { returnedItems in
                resultItems = returnedItems
                
            }
            .store(in: &cancellables)

        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(resultItems, dataService.items)
        XCTAssertEqual(resultItems.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_shouldFailIfEmpty() throws {
        // Given
        let dataService = NewMockDataService(items: [])
        
        // When
        let expError = XCTestExpectation() // throw error expectation
        let expErrorType = XCTestExpectation() // typpe of error expectation
        var resultItems: [String] = []
        dataService.downloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished :
                    XCTFail("Should be failure.")
                case .failure(let error) :
                    expError.fulfill()
                    XCTAssertEqual(error as? URLError, URLError(.badServerResponse)) // check error type here
                    
                    let urlError = error as? URLError
                    if urlError == URLError(.badServerResponse) {
                        expErrorType.fulfill() // check error type
                    }
                }
            } receiveValue: { returnedItems in
                resultItems = returnedItems
                
            }
            .store(in: &cancellables)

        // Then
        wait(for: [expError, expErrorType], timeout: 5)
        XCTAssertEqual(resultItems, dataService.items)
        XCTAssertEqual(resultItems.count, dataService.items.count)
    }
    
}
