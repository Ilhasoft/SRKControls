//
//  CustomCustomComboBoxVCtr.swift
//  BeautyNotes
//
//  Created by Sagar on 12/18/15.
//  Copyright © 2015 Sagar R. Kothari. All rights reserved.
//

import UIKit

@objc public protocol SRKCustomComboBoxDelegate : NSObjectProtocol {
	
	func comboBox(textField:SRKCustomComboBox, didSelect row:Int)
	func comboBoxNumberOfRows(textField:SRKCustomComboBox) -> Int
	func comboBoxHeightForRows(textField:SRKCustomComboBox) -> CGFloat
	func comboBox(textField:SRKCustomComboBox, viewFor row:Int, reusingView view: UIView?) -> UIView
	
	func comboBoxPresentingViewController(textField:SRKCustomComboBox) -> UIViewController
	func comboBoxRectFromWhereToPresent(textField:SRKCustomComboBox) -> CGRect
	
	func comboBoxFromBarButton(textField:SRKCustomComboBox) -> UIBarButtonItem?
	
	func comboBoxTintColor(textField:SRKCustomComboBox) -> UIColor
	func comboBoxToolbarColor(textField:SRKCustomComboBox) -> UIColor
	
	func comboBoxDidTappedCancel(textField:SRKCustomComboBox)
	func comboBoxDidTappedDone(textField:SRKCustomComboBox)
}

@objc public class SRKCustomComboBox: UITextField {
	public weak var delegateForComboBox:SRKCustomComboBoxDelegate?
	var objCustomComboBoxVCtr: CustomComboBoxVCtr?
	
	public func showOptions() {
		let podBundle = NSBundle(forClass: self.classForCoder)
		if let bundleURL = podBundle.URLForResource("SRKControls", withExtension: "bundle") {
			if let bundle = NSBundle(URL: bundleURL) {
				self.objCustomComboBoxVCtr = CustomComboBoxVCtr(nibName: "CustomComboBoxVCtr", bundle: bundle)
				self.objCustomComboBoxVCtr?.modalPresentationStyle = .Popover
				self.objCustomComboBoxVCtr?.popoverPresentationController?.delegate = self.objCustomComboBoxVCtr
				self.objCustomComboBoxVCtr?.refSRKCustomComboBox = self
				if let btn = self.delegateForComboBox?.comboBoxFromBarButton(self) {
					self.objCustomComboBoxVCtr?.popoverPresentationController?.barButtonItem = btn
				} else {
					self.objCustomComboBoxVCtr?.popoverPresentationController?.sourceView = self.delegateForComboBox?.comboBoxPresentingViewController(self).view
					self.objCustomComboBoxVCtr?.popoverPresentationController?.sourceRect = self.delegateForComboBox!.comboBoxRectFromWhereToPresent(self)
				}
				self.delegateForComboBox?.comboBoxPresentingViewController(self).presentViewController(self.objCustomComboBoxVCtr!, animated: true, completion: nil)
			} else {
				assertionFailure("Could not load the bundle")
			}
		} else  {
			assertionFailure("Could not create a path to the bundle")
		}
	}
}

@objc public class CustomComboBoxVCtr: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate {
	
	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var toolBar: UIToolbar!
	weak var refSRKCustomComboBox:SRKCustomComboBox?
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		self.preferredContentSize = CGSizeMake(320, 260)
		if let clr = self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxTintColor(self.refSRKCustomComboBox!) {
			self.toolBar.tintColor = clr
		}
		
		if let clr = self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxToolbarColor(self.refSRKCustomComboBox!) {
			self.toolBar.backgroundColor = clr
		}
		
		self.refSRKCustomComboBox!.delegateForComboBox?.comboBox(self.refSRKCustomComboBox!, didSelect: 0)
	}
	
	override public func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.refSRKCustomComboBox!.delegateForComboBox?.comboBox(self.refSRKCustomComboBox!, didSelect: row)
	}
	
	public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return (self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxNumberOfRows(self.refSRKCustomComboBox!))!
	}
	
	public func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return (self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxHeightForRows(self.refSRKCustomComboBox!))!
	}
	
	public func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
		return (self.refSRKCustomComboBox!.delegateForComboBox?.comboBox(self.refSRKCustomComboBox!, viewFor: row, reusingView: view))!
	}
	
	public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	@IBAction public func btnDoneTapped(sender: UIBarButtonItem) {
		self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxDidTappedDone(self.refSRKCustomComboBox!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction public func btnCancelTapped(sender: UIBarButtonItem) {
		self.refSRKCustomComboBox?.delegateForComboBox?.comboBoxDidTappedCancel(self.refSRKCustomComboBox!)
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	public func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.None
	}
}
