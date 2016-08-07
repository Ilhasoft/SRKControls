//
//  ViewController.swift
//  Example
//
//  Created by Sagar on 12/19/15.
//  Copyright © 2015 Sagar R. Kothari. All rights reserved.
//

import UIKit
import SRKControls

class ViewController: UIViewController, SRKComboBoxDelegate, SRKDateTimeBoxDelegate, UITextFieldDelegate {

	@IBOutlet weak var myComboBox: SRKComboBox!
	@IBOutlet weak var myDateBox: SRKDateTimeBox!
	@IBOutlet weak var myTimeBox: SRKDateTimeBox!

	let arrayForComboBox = ["Sagar", "Sagar R. Kothari", "Kothari", "sag333ar", "sag333ar.github.io", "samurai", "jack", "cartoon", "network"]

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	// MARK:- UITextFieldDelegate

	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		if let txt = textField as? SRKComboBox {
			txt.delegateForComboBox = self
			txt.showOptions()
			return false
		}
		if let txt = textField as? SRKDateTimeBox {
			txt.delegateForDateTimeBox = self
			txt.showOptions()
			return false
		}
		return true
	}

	// MARK:- SRKComboBoxDelegate

	func comboBox(textField: SRKComboBox, didSelectRow row: Int) {
		if textField == self.myComboBox {
			self.myComboBox.text = self.arrayForComboBox[row]
		}
	}

	func comboBoxNumberOfRows(textField: SRKComboBox) -> Int {
		if textField == self.myComboBox {
			return self.arrayForComboBox.count
		} else {
			return 0
		}
	}

	func comboBox(textField: SRKComboBox, textForRow row: Int) -> String {
		if textField == self.myComboBox {
			return self.arrayForComboBox[row]
		} else {
			return ""
		}
	}

	func comboBoxPresentingViewController(textField: SRKComboBox) -> UIViewController {
		return self
	}

	func comboBoxRectFromWhereToPresent(textField: SRKComboBox) -> CGRect {
		return textField.frame
	}

	func comboBoxFromBarButton(textField: SRKComboBox) -> UIBarButtonItem? {
		return nil
	}

	func comboBoxTintColor(textField: SRKComboBox) -> UIColor {
		return UIColor.blackColor()
	}

	func comboBoxToolbarColor(textField: SRKComboBox) -> UIColor {
		return UIColor.whiteColor()
	}

	func comboBoxDidTappedCancel(textField: SRKComboBox) {
		textField.text = ""
	}

	func comboBoxDidTappedDone(textField: SRKComboBox) {
		print("Let's do some action here")
	}

	// MARK:- SRKDateTimeBoxDelegate

	func dateTimeBox(textField: SRKDateTimeBox, didSelectDate date: NSDate) {
		let df = NSDateFormatter()
		if textField == self.myDateBox {
			df.dateFormat = "dd-MMM-yyyy"
			self.myDateBox.text = df.stringFromDate(date)
		} else if textField == self.myTimeBox {
			df.dateFormat = "HH:mm"
			self.myTimeBox.text = df.stringFromDate(date)
		}
	}

	func dateTimeBoxType(textField: SRKDateTimeBox) -> UIDatePickerMode {
		if textField == self.myDateBox {
			return UIDatePickerMode.Date
		} else if textField == self.myTimeBox {
			return UIDatePickerMode.Time
		} else {
			return UIDatePickerMode.Date
		}
	}

	func dateTimeBoxMinimumDate(textField: SRKDateTimeBox) -> NSDate? {
		return nil
	}

	func dateTimeBoxMaximumDate(textField: SRKDateTimeBox) -> NSDate? {
		return nil
	}

	func dateTimeBoxPresentingViewController(textField: SRKDateTimeBox) -> UIViewController {
		return self
	}

	func dateTimeBoxRectFromWhereToPresent(textField: SRKDateTimeBox) -> CGRect {
		return textField.frame
	}

	func dateTimeBoxFromBarButton(textField: SRKDateTimeBox) -> UIBarButtonItem? {
		return nil
	}

	func dateTimeBoxTintColor(textField: SRKDateTimeBox) -> UIColor {
		return UIColor.blackColor()
	}

	func dateTimeBoxToolbarColor(textField: SRKDateTimeBox) -> UIColor {
		return UIColor.whiteColor()
	}

	func dateTimeBoxDidTappedCancel(textField: SRKDateTimeBox) {
		textField.text = ""
	}

	func dateTimeBoxDidTappedDone(textField: SRKDateTimeBox) {
		print("Let's do some action here")
	}

}
