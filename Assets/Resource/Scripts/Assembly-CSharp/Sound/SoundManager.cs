using UnityEngine.Audio;

namespace Sound
{
	public class SoundManager
	{
		public SoundManager(string prefab2D, string prefab3D, string prefabMusic, string prefabUI, int channels2D, int channels3D, int channelsMusic, int channelsUI, string resourcePath, string[] resPathFilters, string dataFileName, bool createListener)
		{
		}

		public AudioMixerGroup[] audioMixer;
		public bool isPlayingMusic;
		public bool dontPlayAnySound;
		public bool dontPlaySound;
		public bool dontPlayMusic;
	}
}
