import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(imaizume_github_ioTests.allTests)
    ]
}
#endif
