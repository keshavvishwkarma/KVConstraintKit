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

public enum LayoutGuideType {
    case Top, Bottom
}

extension UIViewController
{
    /// This method is used to access applied Top Layout Guide constraint if layout guide constraint is exist in self.view for v.
    @available(iOS 7.0, *)
    public final func accessAppliedTopLayoutGuideConstraintFrom(view: UIView) -> NSLayoutConstraint? {
        return accessAppliedLayoutGuideConstraintFrom(view, type: .Top)
    }
    
    /// This method is used to access applied Bottom Layout Guide constraint if layout guide constraint is exist in self.view for v.
    @available(iOS 7.0, *)
    public final func accessAppliedBottomLayoutGuideConstraintFrom(view: UIView) -> NSLayoutConstraint? {
        return accessAppliedLayoutGuideConstraintFrom(view, type: .Bottom)
    }
    
    /// To add Top layout guide constaints
    @available(iOS 7.0, *)
    public final func applyTopLayoutGuideConastrainTo(view: UIView, padding p: CGFloat) {
        applyLayoutGuideConastrainTo(view, type: .Bottom).constant = p
    }
    
    /// To add Bottom layout guide constaints
    @available(iOS 7.0, *)
    public final func applyBottomLayoutGuideConastrainTo(view: UIView, padding p: CGFloat) {
        applyLayoutGuideConastrainTo(view, type: .Bottom).constant = p
    }
    
    /// These method is used to remove the Top Layout Guide constraint. But you cann't remove default TopLayoutGuide constraint.
    @available(iOS 7.0, *)
    public final func removeAppliedTopLayoutGuideConstraintFrom(view: UIView) {
        if let appliedConstraint = accessAppliedLayoutGuideConstraintFrom(view, type: .Top) {
            view.removeConstraint(appliedConstraint)
        }
    }
    
    /// These method is used to remove the Bottom Layout Guide constraint. But you cann't remove default BottomLayoutGuide constraint.
    @available(iOS 7.0, *)
    public final func removeAppliedBottomLayoutGuideConstraintFrom(view: UIView)  {
        if  let appliedConstraint = accessAppliedLayoutGuideConstraintFrom(view, type: .Bottom) {
            view.removeConstraint(appliedConstraint)
        }
    }
    
}

private extension UIViewController
{
    /// These method is used to generate Top/Bottom Layout Guide constraint
    @available(iOS 7.0, *)
    final func prepareLayoutGuideConstraintTo(view: UIView, type t: LayoutGuideType) -> NSLayoutConstraint {
        switch t {
        case .Top:
            return NSLayoutConstraint.prepareConstraint(view, attribute: .Top, toItem: topLayoutGuide, attribute: .Bottom)
        case .Bottom:
            return NSLayoutConstraint.prepareConstraint(bottomLayoutGuide, attribute: .Top, toItem: view, attribute: .Bottom)
        }
    }
    
    /// To add Top/Bottom layout guide constaints
    @available(iOS 7.0, *)
    final func applyLayoutGuideConastrainTo(view:UIView, type t: LayoutGuideType)->NSLayoutConstraint{
        if let appliedConstraint = accessAppliedLayoutGuideConstraintFrom(view, type: t) {
            return appliedConstraint
        } else {
            let prepareLayoutGuideConstraint = prepareLayoutGuideConstraintTo(view, type: t)
            self.view.addConstraint(prepareLayoutGuideConstraint)
            return prepareLayoutGuideConstraint
        }
    }
    
    /// These method is used to access applied LayoutGuide constraint from view of ViewController(self.view) to a specific view(toView).
    @available(iOS 7.0, *)
    final func accessAppliedLayoutGuideConstraintFrom(view: UIView, type: LayoutGuideType) -> NSLayoutConstraint?
    {
        let layoutGuide : UILayoutSupport            = (type == .Top) ? topLayoutGuide : bottomLayoutGuide
        let viewAttribute : NSLayoutAttribute        = (type == .Top) ?  .Top          : .Bottom;
        let layoutGuideAttribute : NSLayoutAttribute = (type == .Top) ?  .Bottom       : .Top;
        
        // Exclude the default constraints and other constraint those can not be layout guide constraints
        let layoutGuideConstraints = view.constraints.filter {
            return ( ( $0.firstItem === layoutGuide && $0.secondItem === view ) || ( $0.secondItem === layoutGuide && $0.firstItem === view) )
            }.filter { return !( $0.firstAttribute == $0.secondAttribute ) }
        
        for constraint in layoutGuideConstraints
        {
            if constraint.firstItem === layoutGuide && constraint.firstAttribute == layoutGuideAttribute &&
                constraint.secondItem === view && constraint.secondAttribute == viewAttribute {
                    return constraint
            } else if constraint.secondItem === layoutGuide && constraint.secondAttribute == layoutGuideAttribute &&
                constraint.firstItem === view && constraint.firstAttribute == viewAttribute {
                    return constraint
            } else {    }
        }
        
        return nil
    }
}

#endif
