//
//  FeedViewController.swift
//  Instagram
//
//  Created by Samba on 2/28/18.
//  Copyright © 2018 Samba. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts: [Post] = []
    var refreshControl : UIRefreshControl!

    override func viewWillAppear(_ animated: Bool) {
        getFeed()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeed()

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(FeedViewController.didPullToReFresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    func getFeed() {
        let query = Post.query()
        query?.limit = 20
        query?.order(byDescending: "_created_at")
        // fetch data asynchronously
        query?.findObjectsInBackground(block: { (posts, error) in
            if  posts != nil {
                // do something with the data fetched
                self.posts = posts as! [Post]
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            } else {
                // handle error
                print(error?.localizedDescription as Any)
            }
        })
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.section]
        print(post.caption)
        print("butts")
        cell.postCaption.text = post.caption
        cell.postImage.file = post.media
        cell.postImage.loadInBackground()
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            let vc = segue.destination as! DetailViewController
            let senderCell = sender as! PostTableViewCell
            
            let indexPath = tableView.indexPath(for: senderCell)
            
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .short
            df.locale = Locale.current
            
            vc.postDate = df.string(from: self.posts[(indexPath?.section)!].createdAt!)
            vc.postFile = self.posts[(indexPath?.section)!].media
            vc.postCaption = self.posts[(indexPath?.section)!].caption
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }

    @objc func didPullToReFresh(_ refreshControl: UIRefreshControl){
        getFeed()
    }
}
