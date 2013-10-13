import processing.opengl.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import java.util.*;
ToxiclibsSupport gfx;
TriangleMesh mesh = new TriangleMesh();
int count,colcount;
//p5 code 
import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 
NetAddress myRemoteLocation;
float prevX;
float prevY;
float prevZ;
float X,Y,Z;
float accelX, accelY, accelZ;
float stretch, moveX; 
DynTri dyntri;


void setup() { 
  size(800,800,OPENGL);
//  frameRate(1);
  gfx=new ToxiclibsSupport(this);
  count = 0;
  colcount = 0;
  smooth(); 
  oscP5 = new OscP5(this,10000); 
  prevX = 0;
  prevY = 0;
  prevZ = 0;
  accelX = 0;
  accelY = 0;
  accelZ = 0;
  myRemoteLocation = new NetAddress("192.168.1.9",10000); 
  dyntri = new DynTri();
  dyntri.updatePoint(0,212,53,134);
  dyntri.updatePoint(1,532,233,234);
  dyntri.updatePoint(2,23,300,174);
} 

void draw() { 
  background(255);
  assenkruis();  
  //translate(mouseX,mouseY,0);
  translate(width / 2, height / 2, 0);
  rotateX(mouseY * 0.01f);
  rotateY(mouseX * 0.01f);
  //rect(width/2,height/2,stretch, stretch); 
  stroke(255,0,0);
  line(width/2,height/2,width*accelX/100,height/2);
  stroke(0,255,0);
  line(width/2,height/2,height/2,width*accelY/100);
  fill(0,0,255);
  ellipse(width*accelX/100,width*accelY/100,accelZ*3,accelZ*3);
  
  count++;
  if(count==3){count=0;} 
  if (accelX + accelY + accelZ > 10) {
    dyntri.updatePoint(count,width*accelX/100, width*accelY/100, accelZ*3);
    println("we have accel");
     addFaces();
    
  }
 
  colcount++;
  if(colcount>255){colcount = 0;};
  fill(colcount,50,50,188);
  gfx.mesh(mesh);  
  
} 
    void oscEvent(OscMessage theOscMessage) { 
    //  println(theOscMessage);
//     if (theOscMessage.checkAddrPattern("/accelerometer") == true) { 
//          stretch= theOscMessage.get(2).floatValue(); 
//    }else if (theOscMessage.checkAddrPattern("/movex") == true){ 
//          moveX= theOscMessage.get(2).floatValue(); 
//    } 
     X = theOscMessage.get(0).floatValue();
     accelX = prevX - X; 
     prevX = X;
     Y = theOscMessage.get(1).floatValue();
     accelY = prevY - Y; 
     prevY = Y;
     Z = theOscMessage.get(2).floatValue();
//     println(Z);
     accelZ = prevZ - Z; 
     prevZ = Z;
//     X = X - 50;
    } 
    

void assenkruis(){
 Vec3D zero = new Vec3D(0,0,0);  
 Vec3D x = new Vec3D(1000,0,0);
 Vec3D y = new Vec3D(0,1000,0);
 Vec3D z = new Vec3D(0,0,1000);
 stroke(255,0,0);
 gfx.line(new Line3D(zero,x)); 
  stroke(0,255,0);
 gfx.line(new Line3D(zero,y)); 
  stroke(0,0,255);
 gfx.line(new Line3D(zero,z)); 

}


void addFaces(){
//  println(mesh.getFaces());
  if (mesh.getFaces().size() > 0) {
    mesh.removeFace(mesh.getFaces().get(0)); 
  }
  mesh.addFace(dyntri.points[0],dyntri.points[1], dyntri.points[2]);
  
//println(dyntri.points[0]);
}


