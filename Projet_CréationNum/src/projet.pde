import peasy.*;

void setup()
{

  size(700, 700, P3D);
  PeasyCam p = new PeasyCam(this, 250);
}


/********************************************************/


/* fonctions pour gérer les couleurs */

// couleurs par hasards.
void couleurs(int i)
{
        if (i%2==0) { 
            stroke((frameCount*sin(i)*2*PI + 255)%255, (frameCount*cos(i)*2*PI - 0)%255, (frameCount*sin(i)*2*PI + 25)%255);
        } else if (i%3==0) {
            stroke((frameCount*cos(i)*2*PI - 255)%255, (frameCount*sin(i)*2*PI + 150)%255, (frameCount*cos(i)*2*PI - 25)%255);
        } else {
            stroke((frameCount*sin(i)*2*PI + 255)%255, (frameCount*cos(i)*2*PI - 255)%255, (frameCount*sin(i)*2*PI + 25)%255);
        }
}

// couleurs pré définies.
void couleursFix(int i)
{
        if (i%2==0) { 
            stroke(255, 0, 25);
        } else if (i%3==0) {
            stroke(255, 150, 25);
        } else {
            stroke(255, 255, 25);
        }
}


/********************************************************/


// créer une sphere.
void drawSphere(float r, float longitudes, float latitudes, int i)
{
        float x, y, z;
        
        // récupérer les coordonnées cartésiennes à partir des coordonnées sphériques (formules classiques).
        x = r * sin(longitudes) * cos(latitudes);
        y = r * sin(longitudes) * sin(latitudes);
        z = r * cos(longitudes);
        
        strokeWeight((frameCount*2/(i+1))%3-(i%0.05));
        point(x, y, z);
}



/********************************************************/


void drawSketch(float r_sphare, float r_noyau, float nb_points)
{
    for (int i=0; i<nb_points; i++) {
      float longitudes = map(i, 0, nb_points, -PI, PI);
      
      for (int j=0; j<nb_points; j++) {
        float latitudes = map(j, 0, nb_points, -PI, PI);
        
        
        couleurs(i);
        drawSphere(r_noyau, longitudes, latitudes, i);
        
        couleursFix(i);
        drawSphere(r_sphare, longitudes, latitudes, i);
      }
    }
}


/********************************************************/

void draw()
{

  background(0);
  fill(255);
  
  
  float nb = 150;
  float r1 = 100;
  float r2 = 30;
 
  drawSketch(r1, r2, nb);

}
