import Foundation
import UIKit


enum GradientDirection {
    case vertical
    case horizontal
    case diagonal
    
    var start: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
    
    var end: CGPoint {
        switch self {
        case .vertical: return CGPoint(x: 0, y: 1)
        case .horizontal: return CGPoint(x: 1, y: 0)
        case .diagonal: return CGPoint(x: 1, y: 1)
        }
    }
}

enum Border: String {
    case top = "topBorder"
    case bottom = "bottomBorder"
    case left = "leftBorder"
    case right = "rightBorder"
}

extension UIView {
    
    @discardableResult
    func addGradient(_ direction: GradientDirection, withColor colors: [UIColor], cornerRadius: CGFloat = 0, shouldPushInBackground: Bool = true) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        if shouldPushInBackground {
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            layer.addSublayer(gradientLayer)
        }
        
        return gradientLayer
    }
    
    func setBorderColor(_ color: UIColor, andWidth width: CGFloat = 1.0){
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
        layer.cornerRadius = r
        layer.masksToBounds = clip
    }
    
    func setCornerRadius(_ r: CGFloat, forCorners corners: CACornerMask, andClipContent clip: Bool = false) {
        layer.maskedCorners = corners
        setCornerRadius(r, andClipContent: clip)
    }
    
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0,
                      bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {
        
        let topLeftRadius = CGSize(width: topLeft, height: topLeft)
        let topRightRadius = CGSize(width: topRight, height: topRight)
        let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
        let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
        let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    @discardableResult
    func loadFromNib<T : UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
    func addTapToDismissKeyboard() {
        addTapAction(#selector(dismissKeyboard))
    }

    func addTapAction(_ action: Selector, target: Any? = nil) {
        let tapGesture = UITapGestureRecognizer(target: target ?? self, action: action)
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func fixInView(_ container: UIView) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container)
    }
    
    func addEqualConstraintsWith(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)].forEach { $0.isActive = true }
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func addBorder(_ border: Border, withColor color: UIColor, andWidth width: CGFloat ){
        let borderLayer = CALayer()
        borderLayer.name = border.rawValue
        borderLayer.backgroundColor = color.cgColor
        switch border {
        case .top:
            borderLayer.frame = CGRect(x:0,y: 0, width:self.frame.size.width, height: width)
        case .bottom:
            borderLayer.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height: width)
        case .left:
            borderLayer.frame = CGRect(x:0, y:0, width: width, height:self.frame.size.height)
        case .right:
            borderLayer.frame = CGRect(x: self.frame.size.width - width,y: 0, width: width, height:self.frame.size.height)
        }
        self.layer.addSublayer(borderLayer)
    }
    
    func removeBorder(_ border: Border){
        for layer in self.layer.sublayers ?? [] {
            if layer.name == border.rawValue {
                layer.removeFromSuperlayer()
            }
        }
    }

    func addDashedBorder(
        width: CGFloat = 1.0,
        color: UIColor = .lightGray.withAlphaComponent(0.5),
        dash: CGFloat = 5.0,
        gap: CGFloat = 5.0) {
    
        setNeedsLayout()
        layoutIfNeeded()
        let borderLayer = CAShapeLayer()
        let rect = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: layer.cornerRadius)
        borderLayer.path = path.cgPath
        borderLayer.lineWidth = width
        borderLayer.strokeColor = color.cgColor
        borderLayer.lineDashPattern = [dash, gap] as [NSNumber]
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.backgroundColor = UIColor.clear.cgColor
        layer.addSublayer(borderLayer)
    }
    
    // Actions
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    func addShadow(color: UIColor = Color.shadow,
                   alpha: Float = 1,
                   x: CGFloat = 0,
                   y: CGFloat = 2,
                   blur: CGFloat = 2 ){
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = alpha
        layer.shadowRadius = blur
        layer.masksToBounds = false
    }
    
}
