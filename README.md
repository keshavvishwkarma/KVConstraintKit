# KVConstraintKit
Impressive Auto Layout DSL for iOS. & It is written in pure swift.

## Custom Operators
The following types of `operators` are provided by `KVConstraintKit`, to `add`, `remove`, `access` and `modify` constraints.

| Operator | Meaning |
| :--------: |-------|
| + | to `add` constraint |
| - | to `remove` constraint |
| * | to modify `multiplier` of constraint |
| ~ | to modify `Priority` ( **UILayoutPriority** ), `Relation` ( **NSLayoutRelation** ) & `Replace` constraint|
| <- | to access constraint by attributes ( **eg. NSLayoutAttribute.Height** ) |
| +== | to add equal relation ( **NSLayoutRelation.Equal** ) constraint |
| +>= | to add greater than or equal relation ( **NSLayoutRelation.GreaterThanOrEqual** ) constraint |
| +<= | to add less than or equal relation ( **NSLayoutRelation.LessThanOrEqual** ) constraint |
| +*== | to add equal relation ( **NSLayoutRelation.Equal** ) constraint with `multiplier` |
| +*>= | to add greater than or equal relation ( **NSLayoutRelation.GreaterThanOrEqual** ) constraint with `multiplier` |
| +*<= | to add less than or equal relation ( **NSLayoutRelation.LessThanOrEqual** ) constraint with `multiplier` |


## Usage

Here's a quick example:
##### Without Using KVConstraintKit
```swift
let v = UIView.prepareNewViewForAutoLayout()
v.backgroundColor = UIColor.redColor()
view.addSubview(v)
        
// Prepare constraints and then add them on superview of view
let top = NSLayoutConstraint(item: v, attribute: .Top,
                             relatedBy: .Equal,
                             toItem: v.superview!, attribute: .Top,
                             multiplier: 1.0, constant: 0)

let leading = NSLayoutConstraint(item: v, attribute: .Leading,
                                 relatedBy: .Equal,
                             toItem: v.superview!, attribute: .Leading,
                             multiplier: 1.0, constant: 0)

let trailing = NSLayoutConstraint(item: v, attribute: .Trailing,
                             relatedBy: .Equal, toItem: v.superview!,
                             attribute: .Trailing,
                             multiplier: 1.0, constant: 0)

let bottom = NSLayoutConstraint(item: v, attribute: .Bottom,
                             relatedBy: .Equal,
                             toItem: v.superview!, attribute: .Bottom,
                             multiplier: 1.0, constant: 0)

v.superview?.addConstraints([top, leading, trailing, bottom])

```
##### Using KVConstraintKit

> ```swift
v +== [.Top, .Leading, .Trailing, .Bottom]
```

##### Similarly for margin constraints
> ```swift
v +== [ .LeadingMargin, .TrailingMargin, .TopMargin, .BottomMargin]
```

### Center
Horizontally

```swift
view.applyConstraintToCenterHorizontallyInSuperview()
```
Vertically

```swift
view.applyConstraintToCenterVerticallyInSuperview()
```
Horizontally & Vertically

```swift
view.applyConstraintToCenterInSuperview()
```

### Fit
Horizontally

```swift
view.applyConstraintFitHorizontallyToSuperview()
```
Vertically

```swift
view.applyConstraintFitVerticallyToSuperview()
```
Horizontally & Vertically

```swift
view.applyConstraintFitToSuperview()
```

Fit with inset

```swift
let inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)    
view.applyConstraintFitToSuperview(contentInset:inset)
```
### Size

Width

```swift
view.applyWidthConstraint(100)
```

Height

```swift
view.applyHeightConstraint(100)
```

Aspact Ratio

```swift
view.applyAspectRatioConstraint()
```

## License

KVConstraintKit is available under the MIT license. See the LICENSE file for more info.

## Contributions

Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.

## Author

If you wish to contact me, email at: keshavvbe@gmail.com
