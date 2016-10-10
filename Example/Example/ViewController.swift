//
//  ViewController.swift
//  Example
//
//  Created by Sagar on 12/19/15.
//  Copyright © 2015 Sagar R. Kothari. All rights reserved.
//

import UIKit

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

	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
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

	func comboBox(_ textField: SRKComboBox, didSelectRow row: Int) {
		if textField == self.myComboBox {
			self.myComboBox.text = self.arrayForComboBox[row]
		}
	}

	func comboBoxNumberOfRows(_ textField: SRKComboBox) -> Int {
		if textField == self.myComboBox {
			return self.arrayForComboBox.count
		} else {
			return 0
		}
	}

	func comboBox(_ textField: SRKComboBox, textForRow row: Int) -> String {
		if textField == self.myComboBox {
			return self.arrayForComboBox[row]
		} else {
			return ""
		}
	}

	func comboBoxPresentingViewController(_ textField: SRKComboBox) -> UIViewController {
		return self
	}

	func comboBoxRectFromWhereToPresent(_ textField: SRKComboBox) -> CGRect {
		return textField.frame
	}

	func comboBoxFromBarButton(_ textField: SRKComboBox) -> UIBarButtonItem? {
		return nil
	}

	func comboBoxTintColor(_ textField: SRKComboBox) -> UIColor {
		return UIColor.black
	}

	func comboBoxToolbarColor(_ textField: SRKComboBox) -> UIColor {
		return UIColor.white
	}

	func comboBoxDidTappedCancel(_ textField: SRKComboBox) {
		textField.text = ""
	}

	func comboBoxDidTappedDone(_ textField: SRKComboBox) {
		print("Let's do some action here")
	}

	// MARK:- SRKDateTimeBoxDelegate

	func dateTimeBox(_ textField: SRKDateTimeBox, didSelectDate date: Date) {
		let df = DateFormatter()
		if textField == self.myDateBox {
			df.dateFormat = "dd-MMM-yyyy"
			self.myDateBox.text = df.string(from: date as Date)
		} else if textField == self.myTimeBox {
			df.dateFormat = "HH:mm"
			self.myTimeBox.text = df.string(from: date as Date)
		}
	}

	func dateTimeBoxType(_ textField: SRKDateTimeBox) -> UIDatePickerMode {
		if textField == self.myDateBox {
			return UIDatePickerMode.date
		} else if textField == self.myTimeBox {
			return UIDatePickerMode.time
		} else {
			return UIDatePickerMode.date
		}
	}

	func dateTimeBoxMinimumDate(_ textField: SRKDateTimeBox) -> Date? {
		return nil
	}

	func dateTimeBoxMaximumDate(_ textField: SRKDateTimeBox) -> Date? {
		return nil
	}

	func dateTimeBoxPresentingViewController(_ textField: SRKDateTimeBox) -> UIViewController {
		return self
	}

	func dateTimeBoxRectFromWhereToPresent(_ textField: SRKDateTimeBox) -> CGRect {
		return textField.frame
	}

	func dateTimeBoxFromBarButton(_ textField: SRKDateTimeBox) -> UIBarButtonItem? {
		return nil
	}

	func dateTimeBoxTintColor(_ textField: SRKDateTimeBox) -> UIColor {
		return UIColor.black
	}

	func dateTimeBoxToolbarColor(_ textField: SRKDateTimeBox) -> UIColor {
		return UIColor.white
	}

	func dateTimeBoxDidTappedCancel(_ textField: SRKDateTimeBox) {
		textField.text = ""
	}

	func dateTimeBoxDidTappedDone(_ textField: SRKDateTimeBox) {
		print("Let's do some action here")
	}

}
