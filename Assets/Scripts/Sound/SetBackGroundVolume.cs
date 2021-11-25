using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

public class SetBackGroundVolume : MonoBehaviour
{
    
    private static readonly string BackGroundPref = "BackGroundPref";
    public AudioMixer mixer;
    
    public void SetLevel(float sliderValue)
    {
        mixer.SetFloat("BackGroundVol", Mathf.Log10(sliderValue) * 20);
        PlayerPrefs.SetFloat(BackGroundPref,sliderValue);
    }
}
