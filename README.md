## Update 11-27-2020
Everything is building with at least iOS 13 now. I hope you're enjoying using SF font features. Let me know if you have any [feedback, bugs, requests, etc.](https://github.com/djfitz/SFFontFeatures/issues)

# SFFontFeatures

A convenience extension to UIFont for enabling features specific to the San Francisco font. 

Many of the features of the San Francisco font are enabled by odd OpenType settings (e.g. Alternate Stylistic Features)
which aren't named in the SDK headers. This class extension abstracts the specifics to enable these features.

Finally, feel free to ask Apple to add to their SDKs interfaces to more easily enable these SF font features (e.g. UIKit).
Particularly, to document the Stylistic Alternatives.

# Cocoapods usage

Add this line to your podfile:

`pod 'SFFontFeatures'`

# Supported San Francisco Font Features

See here for more info about the San Francisco Font:
https://developer.apple.com/fonts/


![Hirez PDF of Features](https://github.com/djfitz/SFFontFeatures/blob/master/SanFranciscoFontFeatures.pdf)
![](https://github.com/djfitz/SFFontFeatures/blob/master/SanFranciscoFontFeatures.png)

# Using SFFontFeatures In Your Code

## Swift

`var theFont = UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)`

`theFont = theFont.withTraits(SFFontFeatureTraits.withHighLegibilityEnabled())`

or

`let traits = SFFontFeatureTraits()`

`traits.highLegibility = .on`

`theFont = theFont.withTraits(traits)`

## Objective-C

`UIFont* theFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];`

`theFont = [theFont fontWithTraits:[SFFontFeatureTraits traitsWithHighLegibilityEnabled]];`

`SFFontFeatureTraits* traits = [[SFFontFeatureTraits alloc] init];`

`traits.straightSidedSixAndNine = on;`

`theFont = [theFont fontWithTraits:traits];`


# NOTES

	NOTE 1: Some of these features are mutually exclusive. e.g. Monospaced Numbers and Proportional numbers.
	They are both in the feature list because sometimes you need to turn off default behavior. However,
	mixing these two settings On in the same font will probably be undefined. Be careful when using multiple
	simultaneous features!

	NOTE 2: Some features are enabled by default but require specific character runs for them to be applied.
	For example, without turning on the fractional form feature directly, it requires the character run that
	is applied this font to be <digits>/<digits>. If the feature doesn't seem to work, check the
	character run. Or turn on the feature explicitly.

	NOTE 3: Some features are on by default for the SF font. If so, turning on a feature won't have any visible effect.
	You can try experimenting turning features on and off to see how they affect the resultant output.

Due to the above limitations/restrictions, if you want to use multiple features in a single string,  it's probably best practice to enable individual font features for ranges of an attributed string. Rather than turning on multiple features for the entire string.

# Features Summary

Here is a list of features that I support:

* Straight-sided six and nine
* Open Four
* Vertically Centered Colon
* High Legibility
* One Story a
* Upper Case Small Capitals
* Lower Case Small Capitals
* Contextual Fractional Forms
* Monospaced/Proportional Numbers
* Superiors/Superscripts
* Inferiors/Subscripts
