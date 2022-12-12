//
//  bestCarOffersUITests.swift
//  bestCarOffersUITests
//
//  Created by Sergey Burish on 08.12.2022.
//

import XCTest

let testMockJSON = """
[{
    "makeModel": "aaa1car",
    "imgPrev":"","carImage":"","state":"","price":0,"mileage":0,"year":0,"owners":0,"descr":""
},
{
    "makeModel": "aaa2car",
    "imgPrev":"","carImage":"","state":"","price":0,"mileage":0,"year":0,"owners":0,"descr":""
},
{
    "makeModel": "bbb1car",
    "imgPrev":"","carImage":"","state":"","price":0,"mileage":0,"year":0,"owners":0,"descr":""
},
{
    "makeModel": "aaa3car",
    "imgPrev":"","carImage":"","state":"","price":0,"mileage":0,"year":0,"owners":0,"descr":""
},
{
    "makeModel": "ccc1car",
    "imgPrev":"","carImage":"","state":"","price":0,"mileage":0,"year":0,"owners":0,"descr":""
}]
"""

class bestCarOffersUITests: XCTestCase {
    var dataStore: DataStore?
    var listDataManager: ListDataManager?
    var listInteractor: ListInteractor?
    
    var testListInteractorOutput: TestListInteractorOutput?
    
    func getMockCarItems() -> [CarItem] {
        let jsonData = testMockJSON.data(using: .utf8)!
        let mockCarItems = try! JSONDecoder().decode([CarItem].self, from: jsonData)
        return mockCarItems
    }
    
    override func setUpWithError() throws {
        let dataStore = DataStore()
        let mockCarItems = getMockCarItems()
        dataStore.carItems = mockCarItems
        
        listDataManager = ListDataManager()
        listDataManager!.dataStore = dataStore
        
        listInteractor = ListInteractor(dataManager: listDataManager!)
        
        testListInteractorOutput = TestListInteractorOutput()
        listInteractor?.output = testListInteractorOutput
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyFilter() throws {
        listInteractor?.findUpcomingItems(filter: "")
        XCTAssertTrue(testListInteractorOutput!.upcomingItems!.count == 5)
    }
    
    func testAAAFilter() throws {
        listInteractor?.findUpcomingItems(filter: "aaa")
        XCTAssertTrue(testListInteractorOutput!.upcomingItems!.count == 3)
    }
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
