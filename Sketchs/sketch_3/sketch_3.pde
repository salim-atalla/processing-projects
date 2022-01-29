void setup()
{

    size(1000, 600);
}



void draw()
{

    background(#555555);
    fill(#000000);
    noStroke();
    
    float wave = sin(radians(frameCount));
    
    ellipse(width/2 + wave*300 , height/2, 100, 100);

}
