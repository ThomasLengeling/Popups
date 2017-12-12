class PumpManager {
  Vector<Pump> mPumps;

  PumpManager() {
    mPumps = new Vector<Pump>();
  }

  void add(Pump p) {
    mPumps.add(p);
  }

  void draw() {
    for (Pump p : mPumps) {
      p.draw();
    }
  }

  void activate(int current) {
    for (Pump p : mPumps) {
      if (p.type == current) {
        p.enabelePump = true;
      }else{
       p.enabelePump = false; 
      }
    }
  }
}