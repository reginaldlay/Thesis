//
//  AudioManager.swift
//  Thesis
//
//  Created by Reginald Lay on 18/06/23.
//

import AVFoundation

class AudioManager {
    
    static let shared = AudioManager()
    
    private var bgm: AVAudioPlayer?
    
    private init() {}
    
    func playBGM() {
        guard let url = Bundle.main.url(forResource: "BGM", withExtension: "mp3") else {
            print("Background music not found.")
            return
        }
        
        do {
            bgm = try AVAudioPlayer(contentsOf: url)
            bgm?.numberOfLoops = -1
            bgm?.prepareToPlay()
            bgm?.play()
        } catch {
            print("Failed to play background music: \(error.localizedDescription)")
        }
    }
    
    func stopBGM() {
        bgm?.stop()
        bgm = nil
    }
    
}
