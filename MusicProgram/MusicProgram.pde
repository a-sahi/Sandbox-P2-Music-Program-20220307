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
int numberOfSongs = 4;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //song1's meta data
int currentSong = numberOfSongs - numberOfSongs;
//
color black=0, purple=#2C08FF; //Gray Scale vs. Hexidecimal
PFont titleFont;
//
void setup() 
{
  //fullScreen(); //Remember, Display Geometry is Mandatory
  minim = new Minim(this); //loads from data directory, loadFile should also load from project folder, like loadImage()
  song[currentSong] = minim.loadFile("MusicDownload/groove.mp3"); //able to pass absulute path, file name & extension, and URL
  song[currentSong+=1] = minim.loadFile("MusicDownload/The_Simplest.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/Start_Your_Engines.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/Beat_Your_Competition.mp3");
  //
  currentSong-=currentSong; //currentSong = currentSong - currentSong
  for ( int i=currentSong; i<song.length; i++ ) {
    songMetaData[i] = song[i].getMetaData();
  }//End Meta Data
  /* FOR summarizes ...
  songMetaData[0] = song[0].getMetaData(); //reads song meta 1, like song1, mimicing array notation
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  */
  titleFont = createFont ("Harrington", 55); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //
  println("Start of Console");
  println("Click the console to Finish Starting this program"); //See previous lesson for OS-level Button
  println("Title:", songMetaData[currentSong].title() );
}//End setup
//
void draw() {
  if ( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount(), "loops left.");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  println("Computer Number of Current Song:", currentSong);
  println("Song Position", song[currentSong].position(), "Song Length", song[currentSong].length() ); //Values in milliseconds
  //
  background (black);
  rect(displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 30); //Change the number until it fits, largest font size
  text(songMetaData[currentSong].title(), displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
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
    song[currentSong].loop(num);
  }//End LOOP
  if ( key=='1' || key=='L' ) song[currentSong].loop(); //No parameter means "infinite loops"
  //
  if ( key>='2' && key!='9' ) println("I do not loop that much! Try again.");
  //
  //Alternate Play-Pause Button
  if ( key=='p' || key=='P' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) { //Special Situation: at the end of the song (built-in stop button)
      //End of Song Calculation: hardcode 1000 OR use formula to say "listen to 80% of the song"
      //Alternate formula: song1.length() - song1.position() <= 1000
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play(); //Parameter is milli-seconds from start of auido file to start of playing
    }
  }//End PLAY-PAUSE Button
  //
  //Forward and Reverse Button
  //Built-in question: .isPlaying()
  if ( key=='f' || key=='F' ) song[currentSong].skip(1000) ; //skip forward 1 second (1000 millisecond)
  if ( key=='r' || key=='R' ) song[currentSong].skip(-1000) ; //skip backward, or reverse, 1 second (1000 millisecond)
  //
  if ( key=='m' || key=='M' ) { //MUTE Button
    if ( song[currentSong].isMuted() ) { 
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }//End MUTE
  //
  if ( key=='s' || key=='S' ) {//STOP Button
   if ( song[currentSong].isPlaying() ) {
     song[currentSong].pause();
     song[currentSong].rewind();
   } else {
     song[currentSong].rewind();
   }
 }//End STOP Button
  //
  if ( key=='n' || key=='N' ) {//Next Button
    if ( song[currentSong].isPlaying() ) {
      //Serious Problems, playing multiple songs at the same time
      song[currentSong].pause();
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    } else {
      song[currentSong].rewind(); ////Built-in rewind feature feature so all songs start at ZERO
      nextButtonArrayCatch();
      song[currentSong].play();
    }
  }//End Next Button
  //
  if ( key=='b' || key=='B' ) {}//End Back Button
  //An Empty Body will not break our program but you will not have a working bee button
  //Assignment: create a working bee button
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
//
