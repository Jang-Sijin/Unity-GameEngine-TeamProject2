using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using UnityEngine.UI;

namespace YoutubePlayer
{
    public class VideoController : MonoBehaviour
    {
        public YoutubePlayer YoutubePlayer;
        private VideoPlayer _videoPlayer;
        public Button bt_play;
        public Button bt_pause;
        public Button bt_reset;

        private void Awake()
        {
            bt_play.interactable = false;
            bt_pause.interactable = false;
            bt_reset.interactable = false;
            _videoPlayer = YoutubePlayer.GetComponent<VideoPlayer>();
            _videoPlayer.prepareCompleted += VideoPlayerPreparedCompleted;
        }

        void VideoPlayerPreparedCompleted(VideoPlayer source)
        {
            bt_play.interactable = source.isPrepared;
            bt_pause.interactable = source.isPrepared;
            bt_reset.interactable = source.isPrepared;
        }

        public async void Prepare()
        {
            print("cargando video...");
            try
            {
                await YoutubePlayer.PrepareVideoAsync();
                print("video cargado");
            }
            catch
            {
                print("ERROR video no cargado");
            }
        }

        public void PlayVideo()
        {
            _videoPlayer.Play();
        }
        
        public void PauseVideo()
        {
            _videoPlayer.Pause();            
        }
        
        public void ResetVideo()
        {
            _videoPlayer.Stop();
            _videoPlayer.Play();
        }

        void OnDestroy()
        {
            _videoPlayer.prepareCompleted -= VideoPlayerPreparedCompleted;
        }
    }
}