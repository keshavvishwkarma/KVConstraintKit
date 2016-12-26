//
// UIViewControllerExtension.swift
//  https://github.com/keshavvishwkarma/KVConstraintKit.git
//
//  Distributed under the MIT License.
//
//  Copyright © 2016 Keshav Vishwkarma. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//

#if os(iOS) || os(tvOS)

import UIKit
    
@available(iOS 7.0, *)
public enum LayoutGuideType {
    case Top, Bottom
}

@available(iOS 7.0, *)
extension UIViewController : LayoutGuidable {   }

@available(iOS 7.0, *)
public func +< T : UIViewController >(lhs: T, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint {
    
    return lhs.applyLayoutGuideConastraint(rhs.0, type: rhs.1)
}

@available(iOS 7.0, *)
public func -< T : UIViewController >(lhs: T, rhs: (View, LayoutGuideType)) {
    
    if let appliedConstraint = lhs.accessLayoutGuideConstraint(rhs.0, type: rhs.1) {
        lhs.view - (appliedConstraint)
    }
}

@available(iOS 7.0, *)
public func <-< T : UIViewController >(lhs: T, rhs: (View, LayoutGuideType)) -> NSLayoutConstraint? {

    return lhs.accessLayoutGuideConstraint(rhs.0, type: rhs.1)
}

extension UIViewController
{
    /// This method is used to access applied Top Layout Guide constraint if layout guide constraint is exist in self.view for v.
    @available(iOS 7.0, *)
    public final func accessAppliedTopLayoutGuideConstraint(fromView: View) -> NSLayoutConstraint? {
        return accessLayoutGuideConstraint(fromView, type: .Top)
    }
    
    /// This method is used to access applied Bottom Layout Guide constraint if layout guide constraint is exist in self.view for v.
    @available(iOS 7.0, *)
    public final func accessAppliedBottomLayoutGuideConstraint(fromView: View) -> NSLayoutConstraint? {
        return accessLayoutGuideConstraint(fromView, type: .Bottom)
    }
    
    /// To add Top layout guide constaints
    @available(iOS 7.0, *)
    public final func applyTopLayoutGuideConastraint(toView: View, padding p: CGFloat) {
        applyLayoutGuideConastraint(toView, type: .Bottom).constant = p
    }
    
    /// To add Bottom layout guide constaints
    @available(iOS 7.0, *)
    public final func applyBottomLayoutGuideConastraint(toView: View, padding p: CGFloat) {
        applyLayoutGuideConastraint(toView, type: .Bottom).constant = p
    }
    
    /// These method is used to remove the Top Layout Guide constraint. But you cann't remove default TopLayoutGuide constraint.
    @available(iOS 7.0, *)
    public final func removeAppliedTopLayoutGuideConstraint(fromView: View) {
        if let appliedConstraint = accessLayoutGuideConstraint(fromView, type: .Top) {
            view.removeConstraint(appliedConstraint)
        }
    }
    
    /// These method is used to remove the Bottom Layout Guide constraint. But you cann't remove default BottomLayoutGuide constraint.
    @available(iOS 7.0, *)
    public final func removeAppliedBottomLayoutGuideConstraint(fromView: View)  {
        if  let appliedConstraint = accessLayoutGuideConstraint(fromView, type: .Bottom) {
            view.removeConstraint(appliedConstraint)
        }
    }
    
}

private extension UIViewController
{
    /// These method is used to generate Top/Bottom Layout Guide constraint
    @available(iOS 7.0, *)
    final func prepareLayoutGuideConstraint(view: View, type t: LayoutGuideType) -> NSLayoutConstraint {
        switch t {
        case .Top:
            return NSLayoutConstraint.prepareConstraint(view, attribute: .Top, toItem: topLayoutGuide, attribute: .Bottom)
        case .Bottom:
            return NSLayoutConstraint.prepareConstraint(bottomLayoutGuide, attribute: .Top, toItem: view, attribute: .Bottom)
        }
    }
    
    /// To add Top/Bottom layout guide constaints
    @available(iOS 7.0, *)
    final func applyLayoutGuideConastraint(view: View, type t: LayoutGuideType)->NSLayoutConstraint {
        if let appliedConstraint = accessLayoutGuideConstraint(view, type: t) {
            return appliedConstraint
        } else {
            let prepareConstraint = prepareLayoutGuideConstraint(view, type: t)
            self.view.addConstraint(prepareConstraint)
            return prepareConstraint
        }
    }
    
    /// These method is used to access applied LayoutGuide constraint from view of ViewController(self.view) to a specific view(toView).
    @available(iOS 7.0, *)
    final func accessLayoutGuideConstraint(fromView: View, type: LayoutGuideType) -> NSLayoutConstraint?
    {
        let layoutGuide : UILayoutSupport            = (type == .Top) ? topLayoutGuide : bottomLayoutGuide
        let viewAttribute : NSLayoutAttribute        = (type == .Top) ?  .Top          : .Bottom;
        let layoutGuideAttribute : NSLayoutAttribute = (type == .Top) ?  .Bottom       : .Top;
        
        // Exclude the default constraints and other constraint those can not be layout guide constraints
        let layoutGuideConstraints = self.view.constraints.filter {
            return ( ( $0.firstItem === layoutGuide && $0.secondItem === fromView ) || ( $0.firstItem === fromView && $0.secondItem === layoutGuide ) )
            }.filter { return !( $0.firstAttribute == $0.secondAttribute ) }
        
        for constraint in layoutGuideConstraints
        {
            if constraint.firstItem === layoutGuide && constraint.firstAttribute == layoutGuideAttribute &&
                constraint.secondItem === fromView && constraint.secondAttribute == viewAttribute {
                    return constraint
            } else if constraint.secondItem === layoutGuide && constraint.secondAttribute == layoutGuideAttribute &&
                constraint.firstItem === fromView && constraint.firstAttribute == viewAttribute {
                    return constraint
            } else {    }
        }
        
        return nil
    }
}

#endif
