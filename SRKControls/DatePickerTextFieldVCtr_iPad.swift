//
//  DatePickerTextFieldVCtr_iPad.swift
//  BeautyNotes
//
//  Created by Sagar on 12/18/15.
//  Copyright © 2015 Altimetrik India Pvt. Ltd. All rights reserved.
//

import UIKit

@objc public protocol DatePickerTextField_iPad_delegate : NSObjectProtocol {
	
	func datePickerTextField(textField:DatePickerTextField_iPad, didSelectDate date:NSDate)
	func datePickerTextFieldType(textField:DatePickerTextField_iPad) -> UIDatePickerMode
	
	func datePickerTextFieldMinimumDate(textField:DatePickerTextField_iPad) -> NSDate?
	func datePickerTextFieldMaximumDate(textField:DatePickerTextField_iPad) -> NSDate?
	
	func datePickerTextFieldPresentingViewController(textField:DatePickerTextField_iPad) -> UIViewController
	func datePickerTextFieldRectFromWhereToPresent(textField:DatePickerTextField_iPad) -> CGRect
	
	func datePickerTextFieldFromBarButton(textField:DatePickerTextField_iPad) -> UIBarButtonItem?
	
	func datePickerTextFieldTintColor(textField:DatePickerTextField_iPad) -> UIColor
	func datePickerTextFieldToolbarColor(textField:DatePickerTextField_iPad) -> UIColor
	
	func datePickerTextFieldDidTappedCancel(textField:DatePickerTextField_iPad)
	func datePickerTextFieldDidTappedDone(textField:DatePickerTextField_iPad)
}

public class DatePickerTextField_iPad: UITextField {
	weak internal var delegateForDatePickerTextField:DatePickerTextField_iPad_delegate?
	var objDatePickerTextFieldVCtr_iPad: DatePickerTextFieldVCtr_iPad?
	
	public func showOptions() {
		self.objDatePickerTextFieldVCtr_iPad = DatePickerTextFieldVCtr_iPad()
		self.objDatePickerTextFieldVCtr_iPad?.modalPresentationStyle = .Popover
		self.objDatePickerTextFieldVCtr_iPad?.refDatePickerTextField = self
		if let btn = self.delegateForDatePickerTextField?.datePickerTextFieldFromBarButton(self) {
			self.objDatePickerTextFieldVCtr_iPad?.popoverPresentationController?.barButtonItem = btn
		} else {
			self.objDatePickerTextFieldVCtr_iPad?.popoverPresentationController?.sourceView = self.delegateForDatePickerTextField?.datePickerTextFieldPresentingViewController(self).view
			self.objDatePickerTextFieldVCtr_iPad?.popoverPresentationController?.sourceRect = (self.delegateForDatePickerTextField?.datePickerTextFieldRectFromWhereToPresent(self))!
		}
		self.delegateForDatePickerTextField?.datePickerTextFieldPresentingViewController(self).presentViewController(self.objDatePickerTextFieldVCtr_iPad!, animated: true, completion: nil)
	}
}

class DatePickerTextFieldVCtr_iPad: UIViewController {
	
	@IBOutlet weak var pickerView: UIDatePicker!
	@IBOutlet weak var toolBar: UIToolbar!
	weak var refDatePickerTextField:DatePickerTextField_iPad?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.preferredContentSize = CGSizeMake(320, 260)
		if let clr = self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldTintColor(self.refDatePickerTextField!) {
			self.toolBar.tintColor = clr
		}
		
		if let clr = self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldToolbarColor(self.refDatePickerTextField!) {
			self.toolBar.backgroundColor = clr
		}
		
		if let max = self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldMaximumDate(self.refDatePickerTextField!) {
			self.pickerView.maximumDate = max
			self.refDatePickerTextField!.delegateForDatePickerTextField?.datePickerTextField(self.refDatePickerTextField!, didSelectDate:max)
		}
		if let min = self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldMinimumDate(self.refDatePickerTextField!) {
			self.pickerView.minimumDate = min
		}
		
		self.pickerView.datePickerMode = (self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldType(self.refDatePickerTextField!))!
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func dateChanged(sender: UIDatePicker) {
		self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextField(self.refDatePickerTextField!, didSelectDate: sender.date)
	}
	
	@IBAction func btnDoneTapped(sender: UIBarButtonItem) {
		self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldDidTappedDone(self.refDatePickerTextField!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction func btnCancelTapped(sender: UIBarButtonItem) {
		self.refDatePickerTextField?.delegateForDatePickerTextField?.datePickerTextFieldDidTappedCancel(self.refDatePickerTextField!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}