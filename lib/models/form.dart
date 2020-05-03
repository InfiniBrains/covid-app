class SymptomsForm {
  bool fever = false;
  bool dryCough = false;
  bool productiveCough = false;
  bool tiredness = false;
  bool bodyAche = false;
  bool headAche = false;
  bool dizziness = false;
  bool diarrhea = false;
  bool nausea = false;
  bool vomit = false;
  bool smell = false;
  bool taste = false;
  bool shortOfBreath = false;
  bool stuffyNose = false;
  bool throatProblems = false;
  bool exposed = false;
  int daysWithSymptoms = 0;
  int heartRate = 0;
  int breathRate = 0;
  int feverDuration = 0;
  SymptomsForm({this.fever, this.dryCough, this.productiveCough, this.tiredness,
  this.bodyAche, this.headAche, this.dizziness, this.diarrhea, this.nausea,
  this.vomit, this.smell, this.taste, this.shortOfBreath, this.stuffyNose,
  this.throatProblems, this.exposed, this.daysWithSymptoms, this.heartRate,
  this.breathRate, this.feverDuration});
}
