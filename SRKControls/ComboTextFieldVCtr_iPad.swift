//
//  ComboTextFieldVCtr_iPad.swift
//  BeautyNotes
//
//  Created by Sagar on 12/18/15.
//  Copyright © 2015 Altimetrik India Pvt. Ltd. All rights reserved.
//

import UIKit

@objc public protocol ComboTextField_iPad_delegate : NSObjectProtocol {
	func comboTextField(textField:ComboTextField_iPad, didSelectRow row:Int)
	func comboTextFieldNumberOfRows(textField:ComboTextField_iPad) -> Int
	func comboTextField(textField:ComboTextField_iPad, textForRow row:Int) -> String
	func comboTextFieldPresentingViewController(textField:ComboTextField_iPad) -> UIViewController
	func comboTextFieldRectFromWhereToPresent(textField:ComboTextField_iPad) -> CGRect
	
	func comboTextFieldFromBarButton(textField:ComboTextField_iPad) -> UIBarButtonItem?
	
	func comboTextFieldTintColor(textField:ComboTextField_iPad) -> UIColor
	func comboTextFieldToolbarColor(textField:ComboTextField_iPad) -> UIColor
	
	func comboTextFieldDidTappedCancel(textField:ComboTextField_iPad)
	func comboTextFieldDidTappedDone(textField:ComboTextField_iPad)
}

public class ComboTextField_iPad: UITextField {
	public weak var delegateForComboTextField:ComboTextField_iPad_delegate?
	var objComboTextFieldVCtr_iPad: ComboTextFieldVCtr_iPad?
	
	public func showOptions() {
		let podBundle = NSBundle(forClass: self.classForCoder)
		if let bundleURL = podBundle.URLForResource("SRKControls", withExtension: "bundle") {
			if let bundle = NSBundle(URL: bundleURL) {
				self.objComboTextFieldVCtr_iPad = ComboTextFieldVCtr_iPad(nibName: "ComboTextFieldVCtr_iPad", bundle: bundle)
				self.objComboTextFieldVCtr_iPad?.modalPresentationStyle = .Popover
				self.objComboTextFieldVCtr_iPad?.popoverPresentationController?.delegate = self.objComboTextFieldVCtr_iPad
				self.objComboTextFieldVCtr_iPad?.refComboTextField_iPad = self
				if let btn = self.delegateForComboTextField?.comboTextFieldFromBarButton(self) {
					self.objComboTextFieldVCtr_iPad?.popoverPresentationController?.barButtonItem = btn
				} else {
					self.objComboTextFieldVCtr_iPad?.popoverPresentationController?.sourceView = self.delegateForComboTextField?.comboTextFieldPresentingViewController(self).view
					self.objComboTextFieldVCtr_iPad?.popoverPresentationController?.sourceRect = (self.delegateForComboTextField?.comboTextFieldRectFromWhereToPresent(self))!
				}
				self.delegateForComboTextField?.comboTextFieldPresentingViewController(self).presentViewController(self.objComboTextFieldVCtr_iPad!, animated: true, completion: nil)
			} else {
				assertionFailure("Could not load the bundle")
			}
		} else  {
			assertionFailure("Could not create a path to the bundle")
		}
	}
}

class ComboTextFieldVCtr_iPad: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate {

	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var toolBar: UIToolbar!
	weak var refComboTextField_iPad:ComboTextField_iPad?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.preferredContentSize = CGSizeMake(320, 260)
		if let clr = self.refComboTextField_iPad?.delegateForComboTextField?.comboTextFieldTintColor(self.refComboTextField_iPad!) {
			self.toolBar.tintColor = clr
		}
		
		if let clr = self.refComboTextField_iPad?.delegateForComboTextField?.comboTextFieldToolbarColor(self.refComboTextField_iPad!) {
			self.toolBar.backgroundColor = clr
		}
		
		self.refComboTextField_iPad!.delegateForComboTextField?.comboTextField(self.refComboTextField_iPad!, didSelectRow: 0)
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.refComboTextField_iPad!.delegateForComboTextField?.comboTextField(self.refComboTextField_iPad!, didSelectRow: row)
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return (self.refComboTextField_iPad?.delegateForComboTextField?.comboTextFieldNumberOfRows(self.refComboTextField_iPad!))!
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return self.refComboTextField_iPad?.delegateForComboTextField?.comboTextField(self.refComboTextField_iPad!, textForRow: row)
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}

	@IBAction func btnDoneTapped(sender: UIBarButtonItem) {
		self.refComboTextField_iPad?.delegateForComboTextField?.comboTextFieldDidTappedDone(self.refComboTextField_iPad!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction func btnCancelTapped(sender: UIBarButtonItem) {
		self.refComboTextField_iPad?.delegateForComboTextField?.comboTextFieldDidTappedCancel(self.refComboTextField_iPad!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.None
	}
}
