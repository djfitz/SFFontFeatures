# SFFontFeatures

A convenience extension to UIFont for enabling features specific to the San Francisco font. 

Many of the features of the San Francisco font are enabled by odd OpenType settings (e.g. Alternate Stylistic Features)
which aren't named in the SDK headers. This class extension abstracts the specifics to enable these features.

# Cocoapods usage

Add this line to your podfile:

`pod 'SFFontFeatures'`

# San Francisco Font Information

See here for more info about the San Francisco Font:
https://developer.apple.com/fonts/


![](https://github.com/djfitz/SFFontFeatures/blob/master/SanFranciscoFontFeatures.png)

# NOTES

	NOTE 1: Some of these features are mutually exclusive. e.g. Monospaced Numbers and Proportional numbers.
	They are both in the feature list because sometimes you need to turn off default behavior. However,
	mixing these two settings On in the same font will probably be undefined. Be careful when using multiple
	simultaneous features!

	NOTE 2: Some features require specific character run requirements. For example, fractional form requires the
	character run that is applied this font to be <digits>/<digits>. If the feature doesn't seem to work,
	check the character run.

	NOTE 3: Some features are on by default for the SF font. If so, turning on a feature won't have any visible effect.
	You can try experimenting turning features off to see how they affect the resultant output.

	NOTE 4: If the feature which should be enabled by default doesn't enable due to the character stream requirements
	not being met, you can try explicitly turning it on. See also SFFontFeatureVerticallyCenteredColon

Due to the above limitations/restrictions, it's probably best practice to enable individual font features for ranges
of an attributed string. Rather than turning on multiple features for the entire string.

# Using SFFontFeatures In Your Code

## Swift

`var theFont = UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)`

`theFont = theFont.withTraits(SFFontFeatureTraits.withHighLegibilityEnabled())`

or

`let traits = SFFontFeatureTraits()`

`traits.highLegibility = TriState.on`

`theFont = theFont.withTraits(traits)`

## Objective-C

`UIFont* theFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];`

`theFont = [theFont fontWithTraits:[SFFontFeatureTraits traitsWithHighLegibilityEnabled]];`

`SFFontFeatureTraits* traits;`

`traits.straightSidedSixAndNine = on;`

`theFont = [theFont fontWithTraits:traits];`

Finally, feel free to ask Apple to add to their SDKs interfaces to more easily enable these SF font features (e.g. UIKit).
Particularly, to document the Stylistic Alternatives.

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
