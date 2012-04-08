#include <ros/ros.h>
#include <body_msgs/Skeletons.h>
#include <tele_doll_catcher/Catcher.h>

bool firstCb=true;
int catcherPos[3]={0,0,0},lastCatcherPos[3]={0,0,0};
class TeleDollCatcher
{
private:
	ros::NodeHandle n_;
	ros::Subscriber skels_sub;
	ros::Publisher dollcatcher_pub;
	body_msgs::Skeletons kinectSkels,lastSkels;
	geometry_msgs::Point lHandPos,lastLHandPos;
    tele_doll_catcher::Catcher doll_order,doll_null;

public:
	TeleDollCatcher()
	{	
	skels_sub = n_.subscribe("skeletons", 1, &TeleDollCatcher::skelCallback, this);
	dollcatcher_pub = n_.advertise<tele_doll_catcher::Catcher>("catcher_move",1);
	}

	
template <typename Point1, typename Point2>
void PointConversion(Point1 pt1, Point2 &pt2){
		pt2.x=pt1.x;
		pt2.y=pt1.y;
		pt2.z=pt1.z;
	}

void UnifyCatcherPos(int catcherPos[3],geometry_msgs::Point handPos)
{
        catcherPos[2]=(int)((handPos.z-1)/0.5*170);//
        catcherPos[1]=(int)(handPos.y/(handPos.z/2-0.25)*125);//
        catcherPos[0]=(int)(handPos.x/(handPos.z/2-0.25)*125);//
}

void skelCallback(const body_msgs::Skeletons skelsCb)
{
	if (firstCb==true)
	{
		lastSkels=skelsCb;
		firstCb=false;
		return;
	}

	if(skelsCb.header.seq == lastSkels.header.seq)
		return;
	
	double tdiff = (skelsCb.header.stamp-lastSkels.header.stamp).toSec();
	if(fabs(tdiff) >.15)//time difference between two frames in use, in seconds
	{

    	doll_order.CATCH_OR_NOT=false;
    	PointConversion(skelsCb.skeletons[0].left_hand.position,lHandPos);
		PointConversion(lastSkels.skeletons[0].left_hand.position,lastLHandPos);
		
    	if ((0.7<lHandPos.z)&&(lHandPos.z<1.9))
    	{
		UnifyCatcherPos(catcherPos,lHandPos);
		UnifyCatcherPos(lastCatcherPos,lastLHandPos);
		
        doll_order.moveTLR=catcherPos[0]-lastCatcherPos[0];
        doll_order.moveTFB=catcherPos[2]-lastCatcherPos[2];

		if(doll_order.moveTLR>0)
			doll_order.MOVE_RIGHT=true;
		else
		{
			doll_order.MOVE_RIGHT=false;
			doll_order.moveTLR=0-doll_order.moveTLR;
		}

		if(doll_order.moveTFB>0)
			doll_order.MOVE_FORWARD=true;
		else
		{
			doll_order.MOVE_FORWARD=false;
			doll_order.moveTFB=0-doll_order.moveTFB;
		}

        if (catcherPos[1]-lastCatcherPos[1]>40)
        	doll_order.CATCH_OR_NOT=true;
    	dollcatcher_pub.publish(doll_order);
    	}
		else dollcatcher_pub.publish(doll_null);
		
		lastSkels = skelsCb;
	}

	return;
}

} ;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "tele_DollCatcher");
	ros::NodeHandle n;
	TeleDollCatcher tDollCatcher;
	ros::spin();	
	return 0;
}
	
