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
//
void setup() 
{
  //fullScreen(); //Remember, Display Geometry is Mandatory
  minim = new Minim(this); //loads from data directory, loadFile should also load from project folder, like loadImage()
  song1 = minim.loadFile("MusicDownload/groove.mp3"); //able to pass absulute path, file name & extension, and URL
  song1.play(); //Parameter is milli-seconds from start of auido file to start of playing
}//End setup
//
void draw() {}//End draw
//
void keyPressed() {}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
//
