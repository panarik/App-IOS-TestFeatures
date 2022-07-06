import XCTest
@testable import Swift_IOS_Features

// Naming: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming: test_[struct or class]_[variable or function]_[expected behavior]
// Structure: Given, When, Then

class UnitTestingViewModel_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() throws {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() throws {
        let userIsPremium: Bool = false
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        XCTAssertFalse(vm.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() throws {
        let userIsPremium: Bool = Bool.random()
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        XCTAssertEqual(userIsPremium, vm.isPremium)
   }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() throws {
        for _ in 0..<100 {
            let userIsPremium: Bool = Bool.random()
            let vm = UnitTestingViewModel(isPremium: userIsPremium)
            XCTAssertEqual(userIsPremium, vm.isPremium)
        }
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() throws {
        let dataArraySize = 0
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        XCTAssertEqual(dataArraySize, vm.dataArray.count)
    }
    
    func test_UnitTestingViewModel_dataArray_appendable() throws {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
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
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        // When
        let text = ""
        vm.addItem(item: text)
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }

    /**
     Generates random `String` with random length from 1 to 32 cymbols.
     */
    private func getRandomString() -> String {
        var result = ""
        let randomSize = Int.random(in : 1...32)
        let list = ["a","b","c","d","1","2","3","4","0"," ","!","?","."]
        for _ in 0...randomSize {
            let randomLetter = list[Int.random(in: 0..<13)]
            result.append(randomLetter)
        }
        return result
    }
    
}
