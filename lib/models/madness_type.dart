enum MadnessType {
  Thought(2),
  Scheme(4),
  Machination(8);

  final int rollValue;
  const MadnessType(this.rollValue);
}
