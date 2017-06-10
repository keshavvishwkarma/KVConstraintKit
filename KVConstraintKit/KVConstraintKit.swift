//
//  KVConstraintKit.swift
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
    
    public typealias View = UIView
    public typealias LayoutPriority = UILayoutPriority
    public typealias EdgeInsets = UIEdgeInsets
#else
    import AppKit
    
    public typealias View = NSView
    public typealias LayoutPriority = NSLayoutPriority
    #if !swift(>=3.0)
        public typealias EdgeInsets = NSEdgeInsets
    #endif
#endif

extension EdgeInsets {
    static var zero: EdgeInsets {
        return edgeInset(CGFloat(0))
    }
    
    static func edgeInset(_ side: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: side, left: side, bottom: side, right: side)
    }
}

/// MARK: TO PREPARE VIEW FOR CONSTRAINTS

/// Types adopting the `AutoLayoutView` protocol can be used to construct Views.
public protocol AutoLayoutView {}
extension View : AutoLayoutView {}

extension AutoLayoutView where Self: View {
    
    /// This method is used to create new instance of ui elements for autolayout.
    public static func prepareAutoLayoutView() -> Self {
        let preparedView = Self()
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        return preparedView
    }
    
    ///This method is used to prepare already created instance of ui elements for autolayout.
    public final func prepareAutoLayoutView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Convenience
    public func addSubviews(_ views : Self...) -> Self {
        self + views; return self
    }
    
}

@discardableResult public func +(lhs: View, rhs: [View]) -> View {
    for aView in rhs {
        _ = lhs + aView
    }
    return lhs
}

@discardableResult public func +(lhs: View, rhs: View) -> View {
    lhs.addSubview(rhs)
    rhs.prepareAutoLayoutView()
    return lhs
}

/// MARK: TO PREPARE CONSTRAINTS
extension View {
    
    /// Generalized public constraint methods for views.
    public final func prepareConstraintToSuperview( attribute attr1: NSLayoutAttribute, attribute attr2:NSLayoutAttribute, relation: NSLayoutRelation = .equal, multiplier:CGFloat = 1.0 ) -> NSLayoutConstraint! {
        assert(superview != nil, "You should have `addSubView` on any other view, called `superview` of receiver’s \(self)");
        
        #if os(iOS) || os(tvOS)
            switch attr1 {
            case .right, .rightMargin, .trailing, .trailingMargin, .bottom, .bottomMargin:
                return View.prepareConstraint(superview, attribute: attr1, secondView: self, attribute:attr2, relation: relation, multiplier:multiplier)
            default: break
            }
            
        #else
            switch attr1 {
            case .right, .trailing, .bottom:
                return View.prepareConstraint(superview, attribute: attr1, secondView: self, attribute:attr2, relation: relation, multiplier:multiplier)
            default: break
            }
            
        #endif
        
        return View.prepareConstraint(self, attribute: attr1, secondView: superview, attribute:attr2, relation: relation, multiplier:multiplier)
    }
    
    /// Prepare constraint of one sibling view to other sibling view and add it into its superview view.
    public final func prepareConstraintFromSiblingView(attribute attr1: NSLayoutAttribute, toAttribute attr2:NSLayoutAttribute, ofView otherSiblingView: View, relation:NSLayoutRelation = .equal, multiplier:CGFloat = 1.0 ) -> NSLayoutConstraint! {
        assert(((NSSet(array: [superview!,otherSiblingView.superview!])).count == 1), "All the sibling views must belong to same superview")
        return View.prepareConstraint(self, attribute: attr1, secondView:otherSiblingView, attribute:attr2, relation:relation,  multiplier: multiplier )
    }
    
}

/// TO APPLY/ADD CONSTRAINTS OR TO REMOVE APPLIED CONSTRAINTS
extension View
{
    /// This is the common methods to add the constraint in the receiver only once. If constraint already exists then it will only update that constraint and return that constraint.
    public final func applyPreparedConstraintInView(constraint c: NSLayoutConstraint) -> NSLayoutConstraint {
        // If this constraint is already added then it update the constraint values else added new constraint.
        let appliedConstraint = constraints.containsApplied(constraint: c)
        if (appliedConstraint != nil)
        {
            appliedConstraint!.constant = c.constant
            if appliedConstraint!.multiplier != c.multiplier || appliedConstraint!.relation != c.relation  {
                self - appliedConstraint!
            }
            else{
                return appliedConstraint!
            }
        }
        
        addConstraint(c)
        return c
    }
    
    public final func applyConstraintFromSiblingView(attribute attr1: NSLayoutAttribute, toAttribute attr2:NSLayoutAttribute, ofView otherSiblingView: View, constant:CGFloat) -> NSLayoutConstraint {
        assert(!constant.isInfinite, "constant of view must not be INFINITY.")
        assert(!constant.isNaN, "constant of view must not be NaN.")
        
        let c = self.prepareConstraintFromSiblingView(attribute: attr1, toAttribute: attr2, ofView: otherSiblingView)
        c?.constant = constant
        return self.superview! + c!
    }
    
    /// MARK: - Remove Constraints From a specific View
    public final func removedConstraintFromSupreview() {
        let superview = self.superview
        removeFromSuperview()
        superview?.addSubview(self)
    }
    
    public final func removedAllConstraints() {
        removedConstraintFromSupreview()
        removeConstraints(constraints)
    }
    
}

/// MARK: TO ACCESS APPLIED CONSTRAINTS
extension View
{
    // MARK: - To Access Applied Constraint By Attributes From a specific View.
    
    public final func accessAppliedConstraintBy(attribute attr: NSLayoutAttribute, relation: NSLayoutRelation = .equal)->NSLayoutConstraint?
    {
        if (attr == .width || attr == .height) {
            let appliedConstraint = accessAppliedConstraintBy(attribute: attr, attribute: attr, relation: relation)
            if appliedConstraint == nil {
                return accessAppliedConstraintBy(attribute: attr, attribute: .notAnAttribute, relation: relation)
            }
            return appliedConstraint
        }
        
        return accessAppliedConstraintBy(attribute: attr, attribute: attr, relation: relation)
    }
    
    
    public final func accessAppliedConstraintBy(attribute attr: NSLayoutAttribute, relation: NSLayoutRelation = .equal, completionHandler: @escaping (NSLayoutConstraint?) -> Void){
        DispatchQueue.main.async { () -> Void in
            completionHandler(self.accessAppliedConstraintBy(attribute: attr, relation: relation))
        }
    }
    
    public final func accessAppliedConstraintBy(attribute attr: NSLayoutAttribute, attribute attr2: NSLayoutAttribute,  relation: NSLayoutRelation = .equal)->NSLayoutConstraint? {
        
        // For Aspect Ratio
        if ( attr == .width && attr2 == .height || attr == .height && attr2 == .width){
            let c = View.prepareConstraint(self, attribute:attr, secondView:self, attribute:attr2, relation:relation)
            let appliedConstraint = constraints.containsApplied(constraint: c!)
            return appliedConstraint
        } // For height & width
        else if attr2 == .notAnAttribute && (attr == .width || attr == .height){
            let c = View.prepareConstraint(self, attribute:attr, attribute:attr2, relation:relation)
            let appliedConstraint = constraints.containsApplied(constraint: c!)
            return appliedConstraint
        }
        else {
            let c = prepareConstraintToSuperview(attribute: attr, attribute: attr2, relation: relation)
            let appliedConstraint = superview?.constraints.containsApplied(constraint: c!)
            return appliedConstraint
        }
    }
    
}

/// MARK: TO UPDATE/MODIFY APPLIED CONSTRAINTS
extension View
{
    /// This method is used to replace already applied constraint by new constraint.
    public final func replacedConastrainInView(appliedConstraint ac: NSLayoutConstraint!, replaceBy constraint: NSLayoutConstraint!) {
        assert( constraint != nil, "modified constraint must not be nil")
        self ~ (ac, constraint )
    }
    
    /// This method is used to change the priority of constraint.
    public final func changedConstraint(_ priority: LayoutPriority, byAttribute attr: NSLayoutAttribute) {
        self ~ (attr, priority )
    }
    
    #if os(iOS) || os(tvOS)
    
    /// This method is used to Update Modified Applied Constraints
    public final func updateModifyConstraints(){
        layoutIfNeeded()
        setNeedsLayout()
    }
    
    public final func updateModifyConstraintsWithAnimation(_ completion:((Bool) -> Void)?)
    {
        let duration = TimeInterval(UINavigationControllerHideShowBarDuration)
        let referenceView = (superview != nil) ? superview! : self
        
        UIView.animate(withDuration: duration, animations: { () -> Void in
            referenceView.updateModifyConstraints()
            }, completion: completion)
        
    }
    
    public final func updateAppliedConstraintConstantValueForIpadBy(attribute a: NSLayoutAttribute) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            updateAppliedConstraintConstantValueBy(a, withConstantRatio: NSLayoutConstraint.Defualt.iPadRatio )
        }
    }
    
    public final func updateAppliedConstraintConstantValueForIphoneBy(attribute a: NSLayoutAttribute) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            updateAppliedConstraintConstantValueBy(a, withConstantRatio: 1.0 / NSLayoutConstraint.Defualt.iPadRatio )
        }
    }
    
    #endif
    
    public final func updateAppliedConstraintConstantValueBy(_ attribute: NSLayoutAttribute, withConstantRatio ratio: CGFloat){
        accessAppliedConstraintBy(attribute: attribute)?.constant *= ratio
    }
    
    
}

extension View
{
    class final func prepareConstraint(_ firstView: View!, attribute attr1: NSLayoutAttribute, secondView: View?=nil, attribute attr2: NSLayoutAttribute = .notAnAttribute, relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint!{
        // assert( (secondView != nil), "both firstView & secondView must not be nil.")
        
        assert(!multiplier.isInfinite, "Multiplier/Ratio of view must not be INFINITY.")
        assert(!multiplier.isNaN, "Multiplier/Ratio of view must not be NaN.")
        
        assert(!constant.isInfinite, "constant of view must not be INFINITY.")
        assert(!constant.isNaN, "constant of view must not be NaN.")
        
        // let preparePinConastrain : NSLayoutConstraint = NSLayoutConstraint(item: firstView, attribute: attr1, relatedBy: relation, toItem: secondView, attribute: attr2, multiplier: multiplier, constant: constant)
        // return preparePinConastrain
        
        return NSLayoutConstraint(item: firstView, attribute: attr1, relatedBy: relation, toItem: secondView, attribute: attr2, multiplier: multiplier, constant: constant)
        
    }
}
