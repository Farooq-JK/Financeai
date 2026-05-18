class PostureResult {
  const PostureResult({
    required this.score,
    required this.backPosition,
    required this.kneePosition,
    required this.balance,
    required this.depth,
  });

  final int score;
  final String backPosition;
  final String kneePosition;
  final String balance;
  final String depth;
}

class PostureService {
  const PostureService();

  // TODO: Connect camera frames to MediaPipe Pose landmarks here later.
  Future<PostureResult> checkPosture() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const PostureResult(
      score: 78,
      backPosition: 'Good',
      kneePosition: 'Needs Improvement',
      balance: 'Good',
      depth: 'Good',
    );
  }
}
