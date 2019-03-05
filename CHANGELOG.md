Changelog
=========
All notable changes to this project will be documented in this file. 
`KVConstraintKit` adheres to [Semantic Versioning](http://semver.org/).

## [2.1](https://github.com/keshavvishwkarma/KVConstraintKit/releases/tag/2.1)
Released on 2019-03-05.

### Improved
-  🎉 Support Swift 4.2 🎉

## [2.0.0](https://github.com/keshavvishwkarma/KVConstraintKit/releases/tag/2.0.0)
Released on 2017-12-18.

### Improved
-  🎉 Support Swift 4 and Xcode 9  🎉

## [1.2.0](https://github.com/keshavvishwkarma/KVConstraintKit/releases/tag/1.2.0)
Released on 2017-9-12.


### Improved
- Added the chainable syntax support.
- Added the carthage support for iOS, macOS, tvOS

### Changed
- Deprecated the below Methods, For more details see the [ApplyViewConstraint](./KVConstraintKit/ApplyViewConstraint.swift) extension of View.

```swift
public final func applyAspectRatioConstraint()
public final func applyWidthConstraint(_ width: CGFloat)
public final func applyHeightConstraint(_ height: CGFloat)
public final func applyAtLeastHeightConstraint(_ height: CGFloat)
public final func applyAtMostHeightConstraint(_ height: CGFloat)
public final func applyAtLeastWidthConstraint(_ width: CGFloat)
public final func applyAtMostWidthConstraint(_ width:CGFloat)  
public final func applyLeftPinConstraintToSuperview(_ padding: CGFloat)
public final func applyRightPinConstraintToSuperview(_ padding: CGFloat)
public final func applyTopPinConstraintToSuperview(_ padding: CGFloat)
public final func applyBottomPinConstraintToSuperview(_ padding: CGFloat)
public final func applyLeadingPinConstraintToSuperview(_ padding: CGFloat)
public final func applyTrailingPinConstraintToSuperview(_ padding: CGFloat)
public final func applyCenterXPinConstraintToSuperview(_ offsetX: CGFloat)
public final func applyCenterYPinConstraintToSuperview(_ offsetY: CGFloat)
public final func applyConstraintToCenterHorizontallyInSuperview(_ offsetX: CGFloat = 0)
public final func applyConstraintToCenterVerticallyInSuperview(_ offsetY: CGFloat = 0)
public final func applyConstraintToCenterInSuperview(_ offset:CGPoint = CGPoint.zero)
public final func applyConstraintFitToSuperview(_ padding: CGFloat )
public final func applyConstraintFitHorizontallyToSuperview(_ padding: CGFloat = 0.0)
public final func applyConstraintFitVerticallyToSuperview(_ padding: CGFloat = 0.0) 
public final func applyConstraintFitToSuperview(contentInset inset:EdgeInsets = EdgeInsets.zero)

```

---

## [1.1](https://github.com/keshavvishwkarma/KVConstraintKit/releases/tag/1.1)
Released on 2017-6-10.

### Added
- Added support for macOS 

### Improved
- Now support Swift 3 and Xcode 8

---

## [1.0.0](https://github.com/keshavvishwkarma/KVConstraintKit/archive/1.0.0.zip)
Released on 2016-12-31.

#### Added
- Initial release of KVConstraintKit.
- Added by [Keshav Vishwkarma](https://github.com/keshavvishwkarma).

