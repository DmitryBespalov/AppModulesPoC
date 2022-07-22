import XCTest
import SnapshotTesting
@testable import Passcode

final class PasscodeTests: XCTestCase {
    func testExample() throws {
        isRecording = false
        let vc = PasscodeViewController()
        assertSnapshot(matching: vc, as: .image, named: "Empty", testName: "Passcode")
            // results in file "Passcode.Empty.png"
    }
}
