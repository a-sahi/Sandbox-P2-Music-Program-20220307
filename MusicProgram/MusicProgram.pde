//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData songMetaData1; //song1's meta data

//
void setup() 
{
  //fullScreen(); //Remember, Display Geometry is Mandatory
  minim = new Minim(this); //loads from data directory, loadFile should also load from project folder, like loadImage()
  song1 = minim.loadFile("MusicDownload/groove.mp3"); //able to pass absulute path, file name & extension, and URL
  songMetaData1 = song1.getMetaData(); //reads song meta 1, like song1, mimicing array notation
  //
  println("Start of Console");
  println("Click the console to Finish Starting this program"); //See previous lesson for OS-level Button
  println("Title:", songMetaData1.title() );
}//End setup
//
void draw() {
  if ( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  //println("Song Position", song1.position(), "Song Length", song1.length() ); //Values in milliseconds
  //
  background (black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 30); //Change the number until it fits, largest font size
  text(songMetaData1.title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program
  //
}//End draw
//
void keyPressed() 
{
  //Only press a number for this code below
  if ( key=='1' || key=='9' ) { //Looping Functions
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    if ( key == '1' ) println("Looping 1 time"); //Once
    if ( key == '9' ) println("Looping 9 times"); //Simulating Infinity
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int num = int(keystr);
    song1.loop(num);
  }//End LOOP
  if ( key=='1' || key=='L' ) song1.loop(); //No parameter means "infinite loops"
  //
  if ( key>='2' && key!='9' ) println("I do not loop that much! Try again.");
  //
  //Alternate Play-Pause Button
  if ( key=='p' || key=='P' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() >= song1.length()-song1.length()*1/5 ) { //Special Situation: at the end of the song (built-in stop button)
      //End of Song Calculation: hardcode 1000 OR use formula to say "listen to 80% of the song"
      //Alternate formula: song1.length() - song1.position() <= 1000
      song1.rewind();
      song1.play();
    } else {
      song1.play(); //Parameter is milli-seconds from start of auido file to start of playing
    }
  }//End PLAY-PAUSE Button
  //
  //Forward and Reverse Button
  //Built-in question: .isPlaying()
  if ( key=='f' || key=='F' ) song1.skip(1000) ; //skip forward 1 second (1000 millisecond)
  if ( key=='r' || key=='R' ) song1.skip(-1000) ; //skip backward, or reverse, 1 second (1000 millisecond)
  //
  if ( key=='m' || key=='M' ) { //MUTE Button
    if ( song1.isMuted() ) { 
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End MUTE
  //
  if ( key=='s' || key=='S' ) {//STOP Button
   if ( song1.isPlaying() ) {
     song1.pause();
     song1.rewind();
   } else {
     song1.rewind();
   }
 }//End STOP Button

  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
//
