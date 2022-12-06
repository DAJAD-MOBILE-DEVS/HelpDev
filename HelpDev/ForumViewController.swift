//
//  ForumViewController.swift
//  HelpDev
//
//  Created by Daniel Milanes  on 11/22/22.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar

class ForumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessageInputBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    let commentBar = MessageInputBar()
    var showsCommentBar = false
    var posts = [PFObject]()
    var selectedPost: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       
        
        commentBar.inputTextView.placeholder = "Add a reply"
        commentBar.sendButton.title = "Post"
        commentBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.keyboardDismissMode = .interactive
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillBeHidden(note: Notification) {
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
        
    }
    
    override var inputAccessoryView: UIView? {
        
        return commentBar
        
    }
    
    override var canBecomeFirstResponder: Bool {
        
        return showsCommentBar
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKeys(["author", "replys", "replys.author"])
        query.limit = 20
        
        query.findObjectsInBackground { posts, error in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        
        let reply = PFObject(className: "Replys")
        
        reply["text"] = text
        reply["post"] = selectedPost
        reply["author"] = PFUser.current()
             
        selectedPost.add(reply, forKey: "replys")
             
        selectedPost.saveInBackground { success, error in
            if success {
                print("Reply saved")
            } else {
                print("Error saving reply")
            }
        }
        
        tableView.reloadData()
        
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
        commentBar.inputTextView.resignFirstResponder()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let post = posts[section]
        let replys = (post["replys"] as? [PFObject]) ?? []
        
        return replys.count + 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.section]
        let replys = (post["replys"] as? [PFObject]) ?? []
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            
            let user = post["author"] as! PFUser
            cell.usernameLabel.text = user.username
            
            cell.commentLabel.text = post["text"] as? String
            
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            
            cell.photoView.af.setImage(withURL: url)

            
            return cell
            
        } else if indexPath.row <= replys.count {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell") as! ReplyCell
            
            let reply = replys[indexPath.row - 1]
            cell.replyLabel.text = reply["text"] as? String
            
            let user = reply["author"] as! PFUser
            cell.nameLabel.text = user.username
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddReplyCell")!
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.section]
        
        let replys = (post["replys"] as? [PFObject]) ?? []
        
        if indexPath.row == replys.count + 1 {
            
            showsCommentBar = true
            becomeFirstResponder()
            commentBar.inputTextView.becomeFirstResponder()
            
            selectedPost = post
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
