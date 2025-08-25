/// Simple settings model storing feature toggles.
class FeatureToggles {
  bool cloudSync = false;
  bool shareHazards = false;
  bool leaderboards = false;
  bool coarseHazards = false;
  PredictFeedMode predictFeed = PredictFeedMode.auto;
}

enum PredictFeedMode { auto, localOnly, external }

const cloudTooltip = 'Backs up rides and shows leaderboards when turned on.';
const hazardTooltip = 'Helps other riders avoid trouble ahead.';
const predictTooltip = 'Use external feeds to refine range estimates.';
