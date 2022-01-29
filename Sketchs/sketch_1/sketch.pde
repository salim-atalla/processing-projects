import peasy.*;


PeasyCam cam;

void setup()
{
      size(500, 500);
      cam = new PeasyCam(this, 400);
}


void draw()
{
      background(255);
      stroke(0);
      strokeWeight(3);
      generateExtrusion();

}



void generateExtrusion()
{
      // déclaration de variables
      float radiusBottom = 50;
      float radiusTop = 100;
      float zMin = -50;
      float zMax = 50;
      int nbSubdiv = 100;
      float deltaAngle = 2*PI/nbSubdiv;
      
      
      // Début
      for (int i=0; i<nbSubdiv; i++) {
            PVector p = pol2cart(0.0, radiusBottom, i*deltaAngle);
            p.z = zMax;
            point(p.x, p.y, p.z);
      }


}
