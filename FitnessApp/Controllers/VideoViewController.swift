//
//  VideoViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: UIViewController {
    
    var length: Int!
    var arts: String!
    var selectedVideo: Videos!
    
let videosArray = [Videos(name: "Arm Training 5 min", video: "Z2DrCQOalBs", art: "Arm", min: 5),
                   Videos(name: "Arm Training 10 min", video: "Eua2Erknyng", art: "Arm", min: 10),
                 Videos(name: "Arm Training 15 min", video: "tecEZkOVRbw", art: "Arm", min: 15 ),
                   Videos(name: "Bauch Training 5 min", video: "e_Z2tX5tkeI",art: "Bauch", min: 5),
                   Videos(name: "Bauch Training 10 min", video: "7P4-W0D21fg", art: "Bauch", min: 10),
                 Videos(name: "Bauch Training 15 min", video: "jUa00O7whXg", art: "Bauch", min: 15),
                 Videos(name: "Bein Training 5 min", video: "T3epz_U0eCc", art: "Bein", min: 5),
                 Videos(name: "Bein Training 10 min", video: "MTl4QRkxZyk", art: "Bein", min: 10),
                   Videos(name: "Bein Training 15 min", video: "scDW9DU67h0", art: "Bein", min: 15),
                   Videos(name: "Cardio Training 5 min", video: "XGtjACeyHtc", art: "Cardio", min: 5),
                  Videos(name: "Cardio Training 10 min", video: "Spc5yl47h1Y", art: "Cardio", min: 10),
                   Videos(name: "Cardio Training 15 min", video: "MDz69fDWxYM", art: "Cardio", min: 15),
                   Videos(name: "Ganz Körper Training 5 min", video: "Q6DOnqC_K4U", art: "Ganz", min: 5),
                  Videos(name: "Ganz Körper Training 10 min", video: "oX_5p0cEU4g", art: "Ganz", min: 10),
                   Videos(name: "Ganz Körper Training 15 min", video: "2r2pSjrfx5Y", art: "Ganz", min: 15),
                   Videos(name: "Po Training 5 min", video: "zXc9ea3gyyY", art: "Po", min: 5),
                   Videos(name: "Po Training 10 min", video: "wfuEfdpvZKw", art: "Po", min: 10),
                   Videos(name: "Po Training 15 min", video: "s9aAE9mn8hE", art: "Po", min: 15),
                   Videos(name: "Yoga Training 5 min", video: "w4FCGciGIms", art: "Yoga", min:5),
                   Videos(name: "Yoga Training 10 min", video: "s6Jazu4oXls", art: "Yoga", min: 10),
                   Videos(name: "Yoga Training 15 min", video: "p7X-GpjtU1M", art: "Yoga", min: 15),
                  Videos(name: "BOP Training 5 min", video: "y87nT-l4fyY", art: "BOP", min: 5),
                   Videos(name: "BOP Training 10 min", video: "oZ7LL5HGhAU", art: "BOP", min: 10),
                   Videos(name: "BOP Training 15 min", video: "NG6BEaF3wqA", art: "BOP", min: 15)
]
    
    
    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let index = videosArray.firstIndex(where: {
            $0.art == arts && $0.min == length
        })
        selectedVideo = videosArray[index!]
        

        videoPlayer.load(withVideoId: selectedVideo.video)
       
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
