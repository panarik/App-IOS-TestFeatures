import Foundation

// MARK: VARIABLE FUNCTION.

// Create
var operation:(Int,Int)->Int // create variable

// Init
operation = plusFunc // init with function

// Use
var result = operation(5,5)
print(result)



// MARK: CLOSURES. Example 1.

let shopList: [String:Double] = [ "Shop 1":13000, "Shop 2":17000, "Shop 3":35000]

// Use closures.
var lowProfitShops1 = shopsFilter(shops: shopList, filter: { $0 < 15000 }) //Inline closures
var lowProfitShops2 = shopsFilter(shops: shopList) { $0 < 15000 } // Trailing closure
var hightProfitShops1 = shopsFilter(shops: shopList, filter: { $0 > 25000 }) //Inline closures
var hightProfitShops2 = shopsFilter(shops: shopList) { $0 > 25000} // Trailing closure

// Use func variables.
var lowProfitShops3 = shopsFilter(shops: shopList, filter: lowProfit)
var hightProfitShops3 = shopsFilter(shops: shopList, filter: highProfit)

print("Hight profit shops: \(hightProfitShops1)")
print("Low profit shops: \(lowProfitShops1)")


func shopsFilter(shops:[String:Double], filter:(Double)->Bool)->[String:Double] {
    var filteredShops = [String:Double]()
    for (key,value) in shops {
        if filter(value) { // use func from param
            filteredShops[key] = value
        }
    }
    return filteredShops
}

func lowProfit(p:Double) -> Bool {
    p < 15000
}

func highProfit(p:Double) -> Bool {
    p > 25000
}

func plusFunc (_ a:Int, _ b:Int) ->Int {
    a+b
}


// MARK: CLOSURES. Example 2.

requestData(
    success: {(responceData) in
        
        print(responceData)
        
    }, error: {(errorMessage) in
        
        print(errorMessage)
    })

func requestData(success: (_ result:Int)->(), error: (_ message:String)->()) {
    // Request code...
    
    let response = Bool.random() // mock server response.
    if response {
        success(10)
    } else {
        error("Error message")
    }
}


// MARK: CLOSURES. Example 3.

var array = [1,3,5,2,3,4434,54,335]
array.sort { first, second in // First.
    first < second
}
array.sort(by: { $0 < $1 }) // Second.
array.sort{$0<$1} // Third.
print(array)
	
