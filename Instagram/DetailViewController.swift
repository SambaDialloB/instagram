//
//  DetailViewController.swift
//  Instagram
//
//  Created by Samba on 2/28/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit
import Parse
import ParseUI



class DetailViewController: UIViewController {

    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var pic: PFImageView!
    var postDate: String!
    var postCaption: String!
    var postFile: PFFile!
    override func viewDidLoad() {
        super.viewDidLoad()
        caption.text = postCaption
        date.text = postDate
        pic.file = postFile
        pic.loadInBackground()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
