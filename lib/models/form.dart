import 'dart:convert';

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

  static SymptomsForm fromJson(Map<String, dynamic> form) {
    var ret = new SymptomsForm();
    ret.dryCough = form['dryCough'];
    ret.fever = form['fever'];
    ret.stuffyNose = form['stuffyNose'];
    ret.shortOfBreath = form['shortOfBreath'];
    ret.bodyAche = form['bodyAche'];
    ret.headAche = form['headAche'];
    ret.smell = form['smell'];
    ret.taste = form['taste'];
    ret.dizziness = form['dizziness'];
    ret.diarrhea = form['diarrhea'];
    ret.vomit = form['vomit'];
    ret.throatProblems = form['throatProblems'];
    ret.exposed = form['exposed'];
    ret.tiredness = form['tiredness'];
    ret.nausea = form['nausea'];
    return ret;
  }
   String toJson() {
     var form = new Map<String, dynamic>();
     form['dryCough'] = this.dryCough;
     form['fever'] = this.fever;
     form['stuffyNose'] = this.stuffyNose;
     form['shortOfBreath'] = this.shortOfBreath;
     form['bodyAche'] = this.bodyAche;
     form['headAche'] = this.headAche;
     form['smell'] = this.smell;
     form['taste'] = this.taste;
     form['dizziness'] = this.dizziness;
     form['diarrhea'] = this.diarrhea;
     form['vomit'] = this.vomit;
     form['throatProblems'] = this.throatProblems;
     form['exposed'] = this.exposed;
     form['tiredness'] = this.tiredness;
     form['nausea'] = this.nausea;
     return jsonEncode(form);

  }

}
