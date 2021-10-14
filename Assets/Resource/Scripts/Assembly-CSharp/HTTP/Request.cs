namespace HTTP
{
	public class Request
	{
		public Request(string method, string uri)
		{
		}

		public string method;
		public string protocol;
		public bool isDone;
		public int maximumRetryCount;
		public bool useCache;
		public RequestState state;
		public long responseTime;
		public bool synchronous;
		public int bufferSize;
	}
}
