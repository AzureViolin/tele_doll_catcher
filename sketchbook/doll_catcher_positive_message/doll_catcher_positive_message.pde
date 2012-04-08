#define BACKWARD_PIN 4 
#define FORWARD_PIN 5
#define LEFT_PIN  6
#define RIGHT_PIN 7
#define CATCH_PIN 10
#define DT 10 //delay time, 10ms 
#define THRESHOLD 4
/* 
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <tele_doll_catcher/Catcher.h>

ros::NodeHandle  nh;

void messageCb( const tele_doll_catcher::Catcher &catcher_msg){

  boolean MOVE_RIGHT=catcher_msg.MOVE_RIGHT;
  boolean MOVE_FORWARD=catcher_msg.MOVE_FORWARD;
  boolean CATCH_OR_NOT=catcher_msg.CATCH_OR_NOT;
  
  if (CATCH_OR_NOT){
    digitalWrite(CATCH_PIN, HIGH);
    delay(200);
    digitalWrite(CATCH_PIN, LOW);
    return;
  }
  
  int moveTLR=catcher_msg.moveTLR;
  int moveTFB=catcher_msg.moveTFB;

  if (MOVE_RIGHT){//if move right
    if (MOVE_FORWARD){  //if move right&forward
      if (( moveTLR > moveTFB )&&( moveTLR > THRESHOLD )){ //if right distance is greater than forward distance
        digitalWrite(RIGHT_PIN, HIGH); //start move right
        if ( moveTFB > THRESHOLD ){
          digitalWrite(FORWARD_PIN, HIGH); //start move forward
          delay(DT*moveTFB); //both moving
          digitalWrite(FORWARD_PIN, LOW);//stop move forward    
        }
        else moveTFB = 0;
        delay(DT*(moveTLR-moveTFB));//keep moving right
        digitalWrite(RIGHT_PIN, LOW);//stop moving right
      }
      else if (( moveTLR < moveTFB )&&( moveTFB > THRESHOLD )){// if forward is greater than right
        digitalWrite(FORWARD_PIN,HIGH);
        if ( moveTLR > THRESHOLD ){
          digitalWrite(RIGHT_PIN,HIGH);
          delay(DT*moveTLR); //both moving
          digitalWrite(RIGHT_PIN, LOW);//stop move right
        }
        else moveTLR = 0;    
        delay(DT*(moveTFB-moveTLR));//keep moving forward
        digitalWrite(FORWARD_PIN, LOW);//stop moving forward
      }
    }
    else if ( !MOVE_FORWARD ){ // if move right&BACKWARD
      if (( moveTLR > moveTFB )&&( moveTLR > THRESHOLD )){ //if right distance is greater than BACKWARD distance
        digitalWrite(RIGHT_PIN, HIGH); //start move right
        if (moveTFB > THRESHOLD){
          digitalWrite(BACKWARD_PIN, HIGH); //start move BACKWARD
          delay(DT*moveTFB); //both moving
          digitalWrite(BACKWARD_PIN, LOW);//stop move BACKWARD
        }
        else moveTFB = 0;    
        delay(DT*(moveTLR-moveTFB));//keep moving right
        digitalWrite(RIGHT_PIN, LOW);//stop moving right
      }
      else if (( moveTLR < moveTFB )&&( moveTFB > THRESHOLD )){// if BACKWARD is greater than right
        digitalWrite(BACKWARD_PIN, HIGH); //start move BACKWARD
        if ( moveTLR > THRESHOLD ){
          digitalWrite(RIGHT_PIN, HIGH); //start move right
          delay(DT*moveTLR); //both moving
          digitalWrite(RIGHT_PIN, LOW);//stop move right    
        }
        else moveTLR = 0;
        delay(DT*(moveTFB-moveTLR));//keep moving BACKWARD
        digitalWrite(BACKWARD_PIN, LOW);//stop moving BACKWARD
      }         
    }
  }
  else if ( !MOVE_RIGHT ){//if move left
    if ( MOVE_FORWARD ){  //if move left&forward
      if (( moveTLR > moveTFB )&&( moveTLR > THRESHOLD)){ //if LEFT distance is greater than forward distance
      digitalWrite(LEFT_PIN, HIGH); //start move LEFT
        if ( moveTFB > THRESHOLD){
          digitalWrite(FORWARD_PIN, HIGH); //start move forward
          delay(DT*moveTFB); //both moving
          digitalWrite(FORWARD_PIN, LOW);//stop move forward    
        }
        else moveTFB = 0;
        delay(DT*(moveTLR-moveTFB));//keep moving LEFT
        digitalWrite(LEFT_PIN, LOW);//stop moving LEFT
      }
      else if ((moveTLR < moveTFB)&&( moveTFB > THRESHOLD)){// if forward is greater than LEFT
      digitalWrite(FORWARD_PIN, HIGH); //start move forward
        if ( moveTLR > THRESHOLD ){
          digitalWrite(LEFT_PIN, HIGH); //start move LEFT
          delay(DT*moveTLR); //both moving
          digitalWrite(LEFT_PIN, LOW);//stop move LEFT    
        }
        else moveTLR = 0;
        delay(DT*(moveTFB-moveTLR));//keep moving forward
        digitalWrite(FORWARD_PIN, LOW);//stop moving forward
      }
    }
    else if ( !MOVE_FORWARD ){ // if move LEFT&BACKWARD
      if (( moveTLR > moveTFB )&&( moveTLR > THRESHOLD)){ //if LEFT distance is greater than BACKWARD distance
      digitalWrite(LEFT_PIN, HIGH); //start move LEFT
        if ( moveTFB > THRESHOLD ){
          digitalWrite(BACKWARD_PIN, HIGH); //start move BACKWARD
          delay(DT*moveTFB); //both moving
          digitalWrite(BACKWARD_PIN, LOW);//stop move BACKWARD    
        }
        else moveTFB = 0;
        delay(DT*(moveTLR-moveTFB));//keep moving LEFT
        digitalWrite(LEFT_PIN, LOW);//stop moving LEFT
      }
      else if (( moveTLR < moveTFB )&&( moveTFB > THRESHOLD)){// if BACKWARD is greater than LEFT
      digitalWrite(BACKWARD_PIN, HIGH); //start move BACKWARD
        if ( moveTLR > THRESHOLD ){
          digitalWrite(LEFT_PIN, HIGH); //start move LEFT
          delay(DT*moveTLR); //both moving
          digitalWrite(LEFT_PIN, LOW);//stop move LEFT    
        }
        else moveTLR = 0;
        delay(DT*(moveTFB-moveTLR));//keep moving BACKWARD
        digitalWrite(BACKWARD_PIN, LOW);//stop moving BACKWARD
      }         
    }     
  }
  
}

ros::Subscriber<tele_doll_catcher::Catcher> sub("catcher_move", &messageCb );

void setup()
{ 
  pinMode(CATCH_PIN, OUTPUT);
  pinMode(BACKWARD_PIN, OUTPUT);
  pinMode(FORWARD_PIN, OUTPUT);
  pinMode(LEFT_PIN, OUTPUT);
  pinMode(RIGHT_PIN, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{  
  nh.spinOnce();
  delay(1);
}


