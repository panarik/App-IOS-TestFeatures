import XCTest
import Combine
@testable import App_IOS_TestFeatures

// Naming: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming: test_[struct or class]_[variable or function]_[expected behavior]
// Structure: Given, When, Then

class UnitTestingViewModel_Test: XCTestCase {

    var vm:UnitTestingViewModel! // Create class for testing.
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        vm = UnitTestingViewModel(isPremium: Bool.random(), dataService: NewMockDataService(items: nil)) // Init class wich will tested
        }

    override func tearDownWithError() throws {
        vm = nil // Reset already tested class
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() throws {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium, dataService: NewMockDataService(items: nil))
        
        // Then
        XCTAssertTrue(viewModel.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() throws {
        let userIsPremium: Bool = false
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium, dataService: NewMockDataService(items: nil))
        XCTAssertFalse(viewModel.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() throws {
        let userIsPremium: Bool = Bool.random()
        let viewModel = UnitTestingViewModel(isPremium: userIsPremium, dataService: NewMockDataService(items: nil))
        XCTAssertEqual(userIsPremium, viewModel.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() throws {
        
        // When
        for _ in 0..<100 {
            let userIsPremium: Bool = Bool.random()
            let viewModel = UnitTestingViewModel(isPremium: userIsPremium, dataService: NewMockDataService(items: nil))
            XCTAssertEqual(userIsPremium, viewModel.isPremium)
        }
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() throws {
        // When
        let dataArraySize = 0
        XCTAssertEqual(dataArraySize, vm.dataArray.count)
    }
    
    func test_UnitTestingViewModel_dataArray_appendable() throws {
        // When
        let loopCount = Int.random(in: 1..<100)
        var array:[String] = []
        for _ in 0..<loopCount {
            let s = getRandomString()
            vm.addItem(item: s)
            array.append(s)
        }
        
        // Then
        XCTAssertEqual(vm.dataArray.count, loopCount) // size appended
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertGreaterThan(vm.dataArray.count, loopCount-1)
        XCTAssertEqual(vm.dataArray, array)
    }
    
    func test_UnitTestingViewModel_dataArray_appendNotEmpty() throws {
        // When
        let text = ""
        vm.addItem(item: text)
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingViewModel_selectedItem_isNillBeforUsing() throws {
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_selectedItem_hasValueAfterValidItemSelected() throws {
        // When
        let item = getRandomString()
        vm.dataArray.append(item)
        vm.selectItem(item: item)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, item)
    }
    
    func test_UnitTestingViewModel_selectedItem_hasValueAfterValidItemSelected_stress() throws {
        // When
        for _ in 0...Int.random(in: 0...1000) {
            vm.dataArray.append(getRandomString())
        }
        let randomItem = vm.dataArray.randomElement()!
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestingViewModel_selectedItem_isNullAfterInvalidItemSelected() throws {
        // When
        vm.dataArray.append(getRandomString())
        vm.selectItem(item: getRandomString())
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_saveItem_shouldThowError_noData() {
        //Then
        XCTAssertThrowsError(try vm.saveItem(item: ""))
        XCTAssertThrowsError(try vm.saveItem(item: ""), "should throw No data error.") {
            let returnedError = $0 as? UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingViewModel_saveItem_shouldThowError_itemNotFound() {
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: getRandomString()))
        XCTAssertThrowsError(try vm.saveItem(item: getRandomString()), "should throw Item not found error.") {
            let returnedError = $0 as? UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingViewModel_saveItem_shouldThowError_shouldSaveItem() throws {
        // When
        for _ in 0...100 {
            vm.dataArray.append(getRandomString())
        }
        let selectedItem = vm.dataArray.randomElement()!
        
        // Then
        XCTAssertNoThrow(try vm.saveItem(item: selectedItem))
        do {
            try vm.saveItem(item: selectedItem)
        } catch {
            XCTFail()
        }
    }
    
    func test_UnitTestingViewModel_downloadWithEscaping_shouldReturnItems() throws {
        // When
        vm.downloadWithEscaping()
        let expectation = XCTestExpectation(description: "Should return items after 3 seconds.")
        
        //Subscire to publisher and looking for change.
        vm.$dataArray
            .dropFirst() // catch first publish 'dataArray'
            .sink { _ in
            expectation.fulfill() // fill expectations when 'vm.dataArray' has changed.
        }
        .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingViewModel_downloadWithCombine_shouldReturnItems() throws {
        // When
        vm.downloadWithCombine()
        let exp = XCTestExpectation(description: "Should return items after a second.")
        
        //Subscire to publisher and looking for change.
        vm.$dataArray
            .dropFirst() // catch first publish 'dataArray'
            .sink { _ in
                exp.fulfill() // fill expectations when 'vm.dataArray' has changed.
        }
        .store(in: &cancellables)
        
        // Then
        wait(for: [exp], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    /**
     Generates random `String` with random length from 1 to 32 cymbols.
     */
    private func getRandomString() -> String {
        var result = ""
        let list = ["a","b","c","d","e","f","g","1","2","3","4","5","6","7","8","0"," ","!","?","."]
        for _ in 0...Int.random(in : 10...64) {
            let randomLetter = list[Int.random(in: 0..<list.count)]
            result.append(randomLetter)
        }
        return result
    }
    
}
