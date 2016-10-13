//
//  EditReadState.swift
//  books
//
//  Created by Andrew Bennet on 25/05/2016.
//  Copyright © 2016 Andrew Bennet. All rights reserved.
//

import Foundation
import UIKit

class EditReadState: ReadStateForm {
    
    var bookToEdit: Book!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!

    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationItem.title = bookToEdit.title
        
        // Load the existing values on to the form when it's about to appear
        ReadState = bookToEdit.readState
        StartedReading = bookToEdit.startedReading
        FinishedReading = bookToEdit.finishedReading
    }
    
    override func OnChange() {
        doneButton.isEnabled = IsValid()
    }
    
    @IBAction func doneWasPressed(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        
        // Create an object representation of the form values
        let newReadStateInfo = BookReadingInformation()
        newReadStateInfo.readState = ReadState
        newReadStateInfo.startedReading = StartedReading
        newReadStateInfo.finishedReading = FinishedReading
        
        // Update and save the book
        bookToEdit.populate(from: newReadStateInfo)
        appDelegate.booksStore.updateSpotlightIndex(for: bookToEdit)
        appDelegate.booksStore.save()
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelWasPressed(_ sender: UIBarButtonItem) {
        // Just exit
        self.view.endEditing(true)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}