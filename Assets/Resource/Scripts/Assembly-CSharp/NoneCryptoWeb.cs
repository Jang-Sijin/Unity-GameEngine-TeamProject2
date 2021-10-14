using Org.BouncyCastle.Security;

public class NoneCryptoWeb : CryptoWeb
{
	public NoneCryptoWeb() : base(default(string), default(string), default(SecureRandom))
	{
	}

}
