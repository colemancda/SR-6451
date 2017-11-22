// https://bugs.swift.org/browse/SR-6451

import Foundation

/// Affine Transform
public struct CGAffineTransform {
    
    // MARK: - Properties
    
    public var a, b, c, d, tx, ty: CGFloat
    
    // MARK: - Initialization
    
    public init(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, tx: CGFloat, ty: CGFloat) {
        
        // faulty initializer, no warning
        // compiler would warn or prevent compilation
        self.init(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
    public static let identity = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
}

open class UIResponder: NSObject {
    
    
}

open class UIView: UIResponder {
    
    public override convenience init() {
        
        self.init(frame: CGRect())
    }
    
    public init(frame: CGRect) {
        super.init()
        
        self.frame = frame
    }
    
    public var frame: CGRect = CGRect()
    
    public let affineTransform: CGAffineTransform = .identity
}

open class UIWindow: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
}

let window = UIWindow()

print("Window initialized")
