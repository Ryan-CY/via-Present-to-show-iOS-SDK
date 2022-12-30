//
//  IntroViewController.swift
//  AVPlayerViewController & IBSegueAction
//
//  Created by Ryan Lin on 2022/12/15.
//

import UIKit
import AVKit
import SafariServices

class IntroViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var IntroTextView: UITextView!
    //宣告兩個變數，分別把兩個自創的型別存入
    var attractionIntro: Attraction!
    var movieIntro: Movie!
    
    var url = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        //用optional binding判斷屬性有內容時要做的事
        if let attractionIntro {
            title = attractionIntro.name
            photoImageView.image = UIImage(named: attractionIntro.photo)
            directorLabel.text = attractionIntro.since
            IntroTextView.text = attractionIntro.intorduction
        }
        if let movieIntro {
            title = movieIntro.name
            photoImageView.image = UIImage(named: movieIntro.photo)
            directorLabel.text = movieIntro.director
            IntroTextView.text = movieIntro.intorduction
        }
    }
    
    @IBAction func playVideoButton(_ sender: Any) {
        
        let controller = AVPlayerViewController()
        
        //用title顯示的名稱判斷要跑的影片
        switch title {
        case "星耀樟怡":
            //用Bundle.main.url(forResource: , withExtension: )讀取程式內影片的路徑
            let videoUrl = Bundle.main.url(forResource: "jewel", withExtension: "mp4")
            //利用型別AVPlayer及其屬性url傳入檔案路徑存入下一頁的播放器
            controller.player = AVPlayer(url: videoUrl!)
        case "S.E.A. 海洋館":
            let videoUrl = Bundle.main.url(forResource: "sea aquarium", withExtension: "mp4")
            controller.player = AVPlayer(url: videoUrl!)
        case "新加坡植物園":
            //也可以寫在一起
            controller.player = AVPlayer(url: Bundle.main.url(forResource: "Botanic Gardens", withExtension: "mp4")!)
        case "阿凡達：水之道":
            controller.player = AVPlayer(url: Bundle.main.url(forResource: "AVATAR2預告", withExtension: "mp4")!)
        case "花路阿朱媽":
            controller.player = AVPlayer(url: Bundle.main.url(forResource: "AJOOMMA預告", withExtension: "mp4")!)
        case "憂鬱之島":
            controller.player = AVPlayer(url: Bundle.main.url(forResource: "Blue Island預告", withExtension: "mp4")!)
        default:
            break
        }
        //呈現controller
        present(controller, animated: true) {
            //播放影片
            controller.player?.play()
        }
    }
    
    @IBAction func showWebsiteButton(_ sender: Any) {
        
        switch title {
            
        case "星耀樟怡":
            //先把網址變成url
            url = URL(string: "https://www.jewelchangiairport.com/")
        case "S.E.A. 海洋館":
            url = URL(string: "https://www.pelago.co/en-SG/activity/pxelg-rws-sea-aquarium-ticket-singapore/?campaignid=17072198831&adgroupid=140538025180&adid=614838960392&gclid=Cj0KCQiAqOucBhDrARIsAPCQL1a3DD5zMAE9ra2--9qbH6rIYz14QxyH1dgNQurcU523fJuGzNMYENsaAndEEALw_wcB")
        case "新加坡植物園":
            url = URL(string:"https://www.nparks.gov.sg/SBG")
        case "阿凡達：水之道":
            url = URL(string:"https://www.avatar.com/")
        case "花路阿朱媽":
            url = URL(string: "https://www.harpersbazaar.com/tw/culture/filmandmusic/g42000475/ajoomma/")
        case "憂鬱之島":
            url = URL(string: "https://www.blueislandmovie.com/zh/%E4%B8%BB%E9%A0%81/")
        default:
            break
        }
        let controller = SFSafariViewController(url: url!)
        //呈現controller
        present(controller, animated: true)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        switch title {
            
        case "星耀樟怡":
            url = URL(string: "https://www.jewelchangiairport.com/")
        case "S.E.A. 海洋館":
            url = URL(string: "https://www.pelago.co/en-SG/activity/pxelg-rws-sea-aquarium-ticket-singapore/?campaignid=17072198831&adgroupid=140538025180&adid=614838960392&gclid=Cj0KCQiAqOucBhDrARIsAPCQL1a3DD5zMAE9ra2--9qbH6rIYz14QxyH1dgNQurcU523fJuGzNMYENsaAndEEALw_wcB")
        case "新加坡植物園":
            url = URL(string:"https://www.nparks.gov.sg/SBG")
        case "阿凡達：水之道":
            url = URL(string:"https://www.avatar.com/")
        case "花路阿朱媽":
            url = URL(string: "https://www.harpersbazaar.com/tw/culture/filmandmusic/g42000475/ajoomma/")
        case "憂鬱之島":
            url = URL(string: "https://www.blueislandmovie.com/zh/%E4%B8%BB%E9%A0%81/")
        default:
            break
        }
        //UIActivityViewController分享的型別，參數activityItems是array可以是任何要分享的型別
        let controller = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        present(controller, animated: true)
        
    }
}
