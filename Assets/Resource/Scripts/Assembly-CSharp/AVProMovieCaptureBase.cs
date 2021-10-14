using UnityEngine;

public class AVProMovieCaptureBase : MonoBehaviour
{
	public enum FrameRate
	{
		Fifteen = 15,
		TwentyFour = 24,
		TwentyFive = 25,
		Thirty = 30,
		Fifty = 50,
		Sixty = 60,
	}

	public enum DownScale
	{
		Original = 1,
		Half = 2,
		Quarter = 4,
		Eighth = 8,
		Sixteenth = 16,
		Specific = 100,
	}

	public enum OutputPath
	{
		RelativeToProject = 0,
		Absolute = 1,
	}

	public enum OutputType
	{
		VideoFile = 0,
		NamedPipe = 1,
	}

	public KeyCode _captureKey;
	public bool _captureOnStart;
	public bool _listVideoCodecsOnStart;
	public string[] _videoCodecPriority;
	public string[] _audioCodecPriority;
	public int _forceVideoCodecIndex;
	public int _forceAudioCodecIndex;
	public int _forceAudioDeviceIndex;
	public FrameRate _frameRate;
	public DownScale _downScale;
	public Vector2 _maxVideoSize;
	public bool _isRealTime;
	public bool _autoGenerateFilename;
	public OutputPath _outputFolderType;
	public string _outputFolderPath;
	public string _autoFilenamePrefix;
	public string _autoFilenameExtension;
	public string _forceFilename;
	public OutputType _outputType;
	public bool _noAudio;
	public AVProUnityAudioCapture _audioCapture;
}
