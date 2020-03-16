import XCTest
@testable import NatDS

class PulsableTests: XCTestCase {

    var sut: FlatButton!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        sut = FlatButton(frame: CGRect(x: 0, y: 0, width: 144, height: 48))
        sut.setTitle("Button", for: .normal)
    }

    func test_beginPulseAt_returnsValidActivePulseLayer() {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)

        sut.beginPulseAt(point: CGPoint(x: 0, y: 0), in: layer)

        XCTAssertNotNil(sut.pulseLayer)
        XCTAssertEqual(sut.pulseLayer?.bounds, layer.bounds)
        XCTAssertEqual(sut.pulseLayer?.fillColor, Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor)
        XCTAssertTrue(layer.sublayers!.contains(sut.pulseLayer!))
    }
}
