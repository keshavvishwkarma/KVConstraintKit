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

import UIKit

public typealias View = UIView

// MARK: TO PREPARE VIEW FORCONSTRAINTS

extension View {
    
    /// This method is used to create new instance of ui elements for autolayout.
    public final class func prepareNewViewForAutoLayout() -> View! {
        let preparedView = View()
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        return preparedView
    }
    
    ///This method is used to prepare already created instance of ui elements for autolayout.
    public final func prepareViewForAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// MARK: TO PREPARE CONSTRAINTS
extension View {
    
    /// Generalized public constraint methods for views
    // For operator +<=,  +==,  +>=,
    public final func prepareConstraintToSuperview(attribute attr1: NSLayoutAttribute, attribute attr2:NSLayoutAttribute, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint! {
        assert(superview != nil, "You should have addSubView on any other its called's Superview \(self)");
        return View.prepareConstraintFor(self, attribute: attr1, secondView: superview, attribute:attr2, relation: relation)
    }
    
    // For operator +== , =<= , =>=
    // For operator +*==, +*>= , +*<=

    // public final func prepareRelationPinConstraintToSuperview(attribute attr1: NSLayoutAttribute,  relation: NSLayoutRelation = .Equal, multiplier:CGFloat = 1.0, constant:CGFloat) -> NSLayoutConstraint! {

    public final func prepareConstraintToSuperview(attribute attr1: NSLayoutAttribute,  relation: NSLayoutRelation = .Equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0) -> NSLayoutConstraint! {
        assert(superview != nil, "You should have addSubView on any other its called's Superview \(self)");

        let preparePinConastrain : NSLayoutConstraint = View.prepareConstraintFor(self, attribute: attr1, secondView: superview, attribute:attr1, relation: relation, multiplier:multiplier, constant:constant)
        return preparePinConastrain
    }
 
    /// Prepare constraint of one sibling view to other sibling view and add it into its superview view.
    // For operator <+<=>,  <+==>, <+>=>
    // <+*<=>, <+*==>, <+*>=>
    // Here defualt multiplier = 1.0
    
    public final func prepareConstraintFromSiblingView(attribute attr1: NSLayoutAttribute, toAttribute attr2:NSLayoutAttribute, ofView otherSiblingView: View, relation:NSLayoutRelation = .Equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0 ) -> NSLayoutConstraint! {
        assert(((NSSet(array: [superview!,otherSiblingView.superview!])).count == 1), "All the sibling views must belong to same superview")
        
        return View.prepareConstraintFor(self, attribute: attr1, secondView:otherSiblingView, attribute:attr2, relation:relation,  multiplier: multiplier, constant:constant)
        // return [self.class prepareConastrainForView:self attribute:attribute secondView:otherSiblingView attribute:toAttribute relation:relation multiplier:defualtMultiplier];
    }
    
}

/// TO APPLY/ADD CONSTRAINTS OR TO REMOVE APPLIED CONSTRAINTS
extension View
{
    /// This is the common methods to add the constraint in the receiver only once. If constraint already exists then it will only update that constraint and return that constraint.
    public final func applyPreparedConstraintInView(constraint c: NSLayoutConstraint) -> NSLayoutConstraint
    {
        // If this constraint is already added then it update the constraint values else added new constraint.
        
        let appliedConstraint = constraints.containsApplied(constraint: c)
        
        // if this constraint is already added then it update the constraint values else added new constraint
        if (appliedConstraint != nil)
        {
            appliedConstraint!.constant = c.constant
            
            if appliedConstraint!.multiplier != c.multiplier  || appliedConstraint!.relation != c.relation  {
                self - appliedConstraint!
            }
            else{
                return appliedConstraint!
            }
        }
        
        addConstraint(c)
        
        return c
        
    }
    
    
    /// MARK: - Remove Constraints From a specific View
    public final func removeAppliedConstraintFromSupreview() {
        let superview = self.superview
        removeFromSuperview()
        superview?.addSubview(self)
    }
    
    public final func removeAllAppliedConstraints() {
        removeAppliedConstraintFromSupreview()
        removeConstraints(constraints)
    }
    
}

// MARK: TO ACCESS APPLIED CONSTRAINTS
extension View
{
    // MARK: - To Access Applied Constraint By Attributes From a specific View
    public final func accessAppliedConstraintBy(attribute attr: NSLayoutAttribute,  relation: NSLayoutRelation = .Equal)->NSLayoutConstraint? {
        let c = prepareConstraintToSuperview(attribute: attr, attribute: attr, relation: relation)
        let appliedConstraint = superview?.constraints.containsApplied(constraint: c)
        return appliedConstraint
    }
    
    public final func accessAppliedConstraintBy(attribute attr: NSLayoutAttribute, relation: NSLayoutRelation = .Equal, completionHandler:     (NSLayoutConstraint?) -> Void){
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            completionHandler(self.accessAppliedConstraintBy(attribute: attr, relation: relation))
        }
    }
    
    /** This method is used to access already applied constraint apply\add constraint between two sibling views. No matter by which sibling View you call this method & no matter order of attributes but you need to call it by one sibling View and pass second other sibling View.
    */
    //    public final func accessAppliedConstraintFromSiblingViewByAttribute(attribute: NSLayoutAttribute, toAttribute: NSLayoutAttribute, ofView otherSiblingView: UIView!) -> NSLayoutConstraint{
    //
    //    }
    
}

/// MARK: TO UPDATE/MODIFY APPLIED CONSTRAINTS
extension View
{
    // MARK : To Update Modified Applied Constraints
    
    public final func updateModifyConstraints(){
        layoutIfNeeded()
        setNeedsLayout()
    }
    
    public final func updateModifyConstraintsWithAnimation(completion:((Bool) -> Void)?)
    {
        let duration = NSTimeInterval(UINavigationControllerHideShowBarDuration)
        let referenceView = (superview != nil) ? superview! : self
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            referenceView.updateModifyConstraints()
            }, completion: completion)
        
    }
    
    public final func updateAppliedConstraintConstantValueForIpadBy(attribute a: NSLayoutAttribute) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            updateAppliedConstraintConstantValueBy(a, withConstantRatio: NSLayoutConstraint.Defualt.iPadRation )
        }
    }
    
    public final func updateAppliedConstraintConstantValueBy(attribute: NSLayoutAttribute, withConstantRatio ratio: CGFloat){
        accessAppliedConstraintBy(attribute: attribute)?.constant *= ratio
    }
    
    /// This method is used to replace already applied constraint by new constraint.
    
    public final func replaceAppliedConastrainInView(appliedConstraint ac: NSLayoutConstraint!, replaceBy constraint: NSLayoutConstraint!) {
        assert( constraint != nil, "modified constraint must not be nil")
        self ~ (ac, constraint )
    }
    
    /// This method is used to change the priority of constraint.
    /// TO DO : Optimise Algorithm
    
    public final func changeAppliedConstraint(priority p: UILayoutPriority, forAttribute attr: NSLayoutAttribute) {
        self ~ (attr, p )
    }
    
}

private extension View{
    class final func prepareConstraintFor(firstView: View!, attribute attr1: NSLayoutAttribute, secondView: View?=nil, attribute attr2: NSLayoutAttribute = .NotAnAttribute, relation: NSLayoutRelation = .Equal, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint!
    {
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
