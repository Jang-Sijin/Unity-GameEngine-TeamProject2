using UnityEngine;

public class GhostGiantEunMiPuzzleBehaviour : MonoBehaviour
{
	public GhostBlackGhostFlyingBehaviour blackGhostPrefab;
	public int maxBlackGhosts;
	public float blackGhostWalkSpeed;
	public float blackGhostDamageRange;
	public float spawnMinDistance;
	public float spawnMaxDistance;
	public float spawnCooltime;
	public float destroyCooltime;
	public Vector3 targetPosition;
}
