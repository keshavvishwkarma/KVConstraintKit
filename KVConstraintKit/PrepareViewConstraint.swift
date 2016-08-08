//
// PrepareViewConstraint.swift
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

private extension View
{
    final func prepareSelfConastrain(attribute attr1: NSLayoutAttribute, constant c: CGFloat = 0) -> NSLayoutConstraint! {
        return View.prepareConstraintFor(self, attribute: attr1, constant:c)
    }
    
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
        
        //         return KVConstraintKit.prepareConstraint(firstView, attribute1: attribute1, relation: relation, toItem: secondView, attribute2: attribute2, multiplier: multiplier, constant: constant)
    }
}

//MARK: TO PREPARE CONSTRAINTS
extension View {
    
    /// Generalized public constraint methods for views
    
    /// for operator +<=,  +==,  +>=,
    public final func prepareConstraintToSuperview(attribute attr1: NSLayoutAttribute, attribute attr2:NSLayoutAttribute, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint! {
        assert(self.superview != nil, "You should have addSubView on any other its called's Superview \(self)");
        return View.prepareConstraintFor(self, attribute: attr1, secondView: superview, attribute:attr2, relation: relation)
    }
    
    /// for operator +==
    public final func prepareEqualRelationPinConstraintToSuperview(attribute attr1: NSLayoutAttribute, constant:CGFloat) -> NSLayoutConstraint! {
        // let preparePinConastrain : NSLayoutConstraint = View.prepareConastrainFor(self, attribute: attr1, secondView: superview, attribute:attr1)
        
        let preparePinConastrain : NSLayoutConstraint = prepareConstraintToSuperview(attribute: attr1, attribute: attr1) // nexted stack at runtime for function call
        
        assert(!constant.isInfinite, "Constant must not be INFINITY.")
        assert(!constant.isNaN, "Constant must not be NaN.")
        preparePinConastrain.constant = constant
        
        return preparePinConastrain
    }
    
    /// For operator +*==
    public final func prepareEqualRelationPinRatioConstraintToSuperview(attribute attr1: NSLayoutAttribute, multiplier:CGFloat, constant: CGFloat = 0) -> NSLayoutConstraint! {
        assert(self.superview != nil, "You should have addSubView on any other its called's Superview \(self)");
        return View.prepareConstraintFor(self, attribute: attr1, secondView: superview, attribute:attr1, multiplier: multiplier, constant:constant)
    }
    
    /// Prepare constraint of one sibling view to other sibling view and add it into its superview view.
    
    public final func prepareConstraintFromSiblingView(attribute attr1: NSLayoutAttribute, toAttribute attr2:NSLayoutAttribute, ofView otherSiblingView: View, relation:NSLayoutRelation) -> NSLayoutConstraint! {
        assert(((NSSet(array: [superview!,otherSiblingView.superview!])).count == 1), "All the sibling views must belong to same superview")
        
        // Here defualt multiplier = 1.0 // <+<=>, <+==>, <+>=>
        return View.prepareConstraintFor(self, attribute: attr1, secondView:otherSiblingView, attribute:attr2, relation:relation )
        // return [self.class prepareConastrainForView:self attribute:attribute secondView:otherSiblingView attribute:toAttribute relation:relation multiplier:defualtMultiplier];
    }
    
    /// Here defualt multiplier = 1.0 // <+*<=>, <+*==>, <+*>=>
    public final func prepareConstraintFromSiblingView(attribute attr1: NSLayoutAttribute, toAttribute attr2:NSLayoutAttribute, ofView otherSiblingView: View, multiplier:CGFloat) -> NSLayoutConstraint! {
        assert(((NSSet(array: [superview!,otherSiblingView.superview!])).count == 1), "All the sibling views must belong to same superview")
        return View.prepareConstraintFor(self, attribute: attr1, secondView:otherSiblingView, attribute:attr2, multiplier:multiplier )
    }
    
}
