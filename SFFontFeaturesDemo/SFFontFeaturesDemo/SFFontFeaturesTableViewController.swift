//
//  SFFontFeaturesTableViewController.swift
//  SFFontFeaturesDemo
//
//  Created by Doug Hill on 12/8/16.
//  Copyright © 2016 doughill. All rights reserved.
//

import UIKit

class SFFontFeaturesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 50
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeatureTableViewCell.cellID, for: indexPath) as! FeatureTableViewCell

        // Reset any previous default traits from the reused cell.
        // Contextual alternatives encapsulate a number of font features, often dependent on the character string, so turn this feature
        // off so it doesn't affect the results in the table.
        cell.regularLabel.font  = UIFont.systemFont(ofSize: cell.regularLabel.font.pointSize,  weight: .regular).withTraits( SFFontFeatureTraits.withContextualAlternativeDisabled() )
        cell.featuredLabel.font = UIFont.systemFont(ofSize: cell.featuredLabel.font.pointSize, weight: .regular).withTraits( SFFontFeatureTraits.withContextualAlternativeDisabled() )

        // Show one font feature for each row

        switch indexPath.row {
            case 0:
                cell.descLabel.text     = "Straight-sided six and nine"
                cell.regularLabel.text  = "6 9"
                cell.featuredLabel.text = "6 9"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits(SFFontFeatureTraits.withStraightSidedSixAndNineEnabled())

            case 1:
                cell.descLabel.text     = "Open 4"
                cell.regularLabel.text  = "1234"
                cell.featuredLabel.text = "1234"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits(SFFontFeatureTraits.withOpenFourEnabled())

            case 2:
                cell.descLabel.text     = "High Legibility"
                cell.regularLabel.text  = "labcd0123456789 11:15"

                cell.featuredLabel.text = "labcd0123456789 11:15"
                let traits = SFFontFeatureTraits()
                traits.highLegibility = TriState.on
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits(SFFontFeatureTraits.withHighLegibilityEnabled())

            case 3:
                cell.descLabel.text     = "Vertically Centered Colon"
                cell.regularLabel.text  = ":21"

                let regTraits = SFFontFeatureTraits()
                regTraits.contextualAlternatives = TriState.off
                cell.regularLabel.font = cell.featuredLabel.font.withTraits(regTraits)

                cell.featuredLabel.text = ":21"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits(SFFontFeatureTraits.withVerticallyCenteredColonEnabled())

            case 4:
                cell.descLabel.text     = "One Story A"
                cell.regularLabel.text  = "a"
                cell.featuredLabel.text = "a"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits(SFFontFeatureTraits.withOneStoryAEnabled())

            case 5:
                cell.descLabel.text     = "Upper Case Small Capitals"
                cell.regularLabel.text  = "abcdefghABCDEFGH"
                cell.featuredLabel.text = "abcdefghABCDEFGH"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withUpperCaseSmallCapitalsEnabled() )

            case 6:
                cell.descLabel.text     = "Lower Case Small Capitals"
                cell.regularLabel.text  = "abcdefghABCDEFGH"
                cell.featuredLabel.text = "abcdefghABCDEFGH"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withLowerCaseSmallCapitalsEnabled() )

            case 7:
                cell.descLabel.text     = "Contextual Fractional Form"
                cell.regularLabel.text  = "99/100"
                cell.featuredLabel.text = "99/100"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withContextualFractionalFormsEnabled() )

            case 8:
                cell.descLabel.text     = "Monospaced vs. Proportional Numbers"
                cell.regularHeaderLabel.text = "  Proportional Numbers"
                cell.regularLabel.text  = "0123456789"
                cell.regularLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withProportionallySpacedNumbersEnabled() )
                cell.featuredHeaderLabel.text = "Monospaced Numbers"
                cell.featuredLabel.text = "0123456789"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withMonospacedNumbersEnabled() )


            case 9:
                cell.descLabel.text     = "Superior Positions (Superscript)"
                cell.regularLabel.text = "See alsoibid"

                let pref = NSMutableAttributedString(string: "See also")

                pref.append(
                    NSMutableAttributedString(
                        string: "ibid",
                        attributes:
                        [
                            .font :
                            cell.regularLabel.font?.withTraits(
                                SFFontFeatureTraits.withSuperiorPositionsEnabled()) as Any
                        ] ))

                cell.featuredLabel.attributedText = pref

            case 10:
                cell.descLabel.text     = "Inferior Positions (Subscript)"
                cell.regularLabel.text  = "C1H2O3S"
                cell.featuredLabel.text = "C1H2O3S"
                cell.featuredLabel.font = cell.featuredLabel.font.withTraits( SFFontFeatureTraits.withInferiorPositionsEnabled() )

            default:
                cell.descLabel.text     = "Dunno about this one"
                cell.regularLabel.text  = "1 maybe 2"
                cell.featuredLabel.text = "1 or 2"
        }

        return cell
    }

}
