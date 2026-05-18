import '../models/fitness_profile.dart';

class LocalStorageService {
  static FitnessProfile? _savedProfile;

  // Placeholder for local storage. Later this can be replaced with SharedPreferences or SQLite.
  static void saveFitnessProfile(FitnessProfile profile) {
    _savedProfile = profile;
  }

  static FitnessProfile? getFitnessProfile() {
    return _savedProfile;
  }
}
