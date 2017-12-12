boolean lock = false;
boolean sendOnce = false;
boolean sendDone = true;
int counter = 0;
int maxOunter = 300;
int currentPad = 0;

int tempPad = 0;
boolean receivedMsg = false;

boolean activatePad_1 = false;
boolean activatePad_2 = false;
boolean activatePad_3 = false;
boolean activatePad_4 = false;

IntList arraySequence = new IntList();
int currentSequence = 0;

void serialUpdate() {

  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
    //println(val);

    receivedMsg = true;


    if (val == 97) { //7

      if (!got) {
        //currentPad = 1;
        tempPad++;
        if (tempPad>= 4) {
          tempPad = 1;
        }
        currentPad = tempPad;

        arraySequence.append(tempPad);
        got = true;

        if (sendDone) {
          sendOnce = true;
          counter = 0;
          lock = false;
        }
      }
    } else if ( val == 72) { //3
      if (!got) {
        //currentPad = 2; 

        tempPad--;
        if (tempPad <= 0) {
          tempPad = 4;
        }

        currentPad = tempPad;


        arraySequence.append(tempPad);

        got = true;

        if (sendDone) {
          sendOnce = true;
          counter = 0;
          lock = false;
        }
      }
    } else if (val == 81) { //5
      if (!got) {
        currentPad = 3;

        //int pad =arraySequence.get(currentSequence);

        got = true;

        if (sendDone) {
          sendOnce = true;
          counter = 0;
          lock = false;
        }
      }
    } else if (val == 197) { //1
      if (!got) {
        currentPad = 4;
        got = true;

        // arraySequence.clear();
        //currentSequence= 0;

        if (sendDone) {
          sendOnce = true;
          counter = 0;
          lock = false;
        }
      }
    }
  }




  if (canSend) {

    if (sendOnce) {
      if (got) {
        println("once");

        if (currentPad == 1) {
          serialFountain.write(messageOm_0);
          println("sent on 0");
        } else if (currentPad == 2) {
          serialFountain.write(messageOn_1);
          println("sent on 1");
        } else  if (currentPad == 3) {
          serialFountain.write(messageOn_2);
          println("sent on 2");
        } else if (currentPad == 4) {
          serialFountain.write(messageOn_3);
          println("sent on 3");
        }
      }
    }

    sendOnce = false;
    sendDone = false;
  }

  if (!sendDone) {

    counter++;
    if (counter > 160) {

      if (currentPad == 1) {
        serialFountain.write(messageOff_0);
        println("sento off 0");
      } else if (currentPad == 2 ) {
        serialFountain.write(messageOff_1);
        println("sent off 1");
      } else if (currentPad == 3) {
        serialFountain.write(messageOff_2);
        println("sent off 2");
      } else if (currentPad == 4) {
        serialFountain.write(messageOff_3);
        println("sent off 3");
      }

      currentPad = 0;

      counter = 0;
      sendDone = true;
      got = false;
    }
  }

  if (receivedMsg) {              // If the serial value is 0,
    fill(255);                   // set fill to black
  } else {                       // If the serial value is not 0,
    fill(0);                 // set fill to light gray
  }

  receivedMsg = false;
  rect(50, 50, 100, 100);
}