import XCTest
@testable import NatDS

class PulseLayerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_startPulse_expectedPulseLayerEqualsToLayer() {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)

        let pulseLayer = PulseLayer()
        pulseLayer.startPulseAt(point: CGPoint(x: 0, y: 0))

        XCTAssertEqual(pulseLayer.opacity, 1)
        XCTAssertEqual(pulseLayer.bounds, layer.bounds)
    }

    func test_endPulse_expectedPulseLayerWasRemoved() {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)

        let pulseLayer = PulseLayer()
        pulseLayer.endPulse()

        XCTAssertNil(pulseLayer.sublayers)
    }
}