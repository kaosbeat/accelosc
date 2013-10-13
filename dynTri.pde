class DynTri {
  Vec3D[] points; 


  DynTri() {
    points=new Vec3D[3];

  }

  void updatePoint(int idx, float x, float y, float z) {
//    int idx=0; 
    points[idx]=new Vec3D(x, y, z);
//    println(points[idx]);
  }


//  void draw() {
//    noFill();
//    stroke(255, 0, 0);
//    pushMatrix();
//    drawShape();
//    scale(-1, 1);
//    drawShape();
//    popMatrix();
//  }  
//
//  void drawShape() {
//    beginShape();
//    //    Iterator i=spline.vertices.iterator();
//    for (int i=0; i < points.length; i++) { 
//      println(points);      
//      Vec3D v=(Vec3D)points[i];
//      vertex(v.x, v.y, v.z);
//      //println(z);
//    }
//    endShape();
//  }
}

