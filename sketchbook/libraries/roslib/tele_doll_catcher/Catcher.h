#ifndef _ROS_tele_doll_catcher_Catcher_h
#define _ROS_tele_doll_catcher_Catcher_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace tele_doll_catcher
{

  class Catcher : public ros::Msg
  {
    public:
      int16_t moveTLR;
      int16_t moveTFB;
      bool MOVE_RIGHT;
      bool MOVE_FORWARD;
      bool CATCH_OR_NOT;

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_moveTLR;
      u_moveTLR.real = this->moveTLR;
      *(outbuffer + offset + 0) = (u_moveTLR.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_moveTLR.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->moveTLR);
      union {
        int16_t real;
        uint16_t base;
      } u_moveTFB;
      u_moveTFB.real = this->moveTFB;
      *(outbuffer + offset + 0) = (u_moveTFB.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_moveTFB.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->moveTFB);
      union {
        bool real;
        uint8_t base;
      } u_MOVE_RIGHT;
      u_MOVE_RIGHT.real = this->MOVE_RIGHT;
      *(outbuffer + offset + 0) = (u_MOVE_RIGHT.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->MOVE_RIGHT);
      union {
        bool real;
        uint8_t base;
      } u_MOVE_FORWARD;
      u_MOVE_FORWARD.real = this->MOVE_FORWARD;
      *(outbuffer + offset + 0) = (u_MOVE_FORWARD.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->MOVE_FORWARD);
      union {
        bool real;
        uint8_t base;
      } u_CATCH_OR_NOT;
      u_CATCH_OR_NOT.real = this->CATCH_OR_NOT;
      *(outbuffer + offset + 0) = (u_CATCH_OR_NOT.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->CATCH_OR_NOT);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_moveTLR;
      u_moveTLR.base = 0;
      u_moveTLR.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_moveTLR.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->moveTLR = u_moveTLR.real;
      offset += sizeof(this->moveTLR);
      union {
        int16_t real;
        uint16_t base;
      } u_moveTFB;
      u_moveTFB.base = 0;
      u_moveTFB.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_moveTFB.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->moveTFB = u_moveTFB.real;
      offset += sizeof(this->moveTFB);
      union {
        bool real;
        uint8_t base;
      } u_MOVE_RIGHT;
      u_MOVE_RIGHT.base = 0;
      u_MOVE_RIGHT.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->MOVE_RIGHT = u_MOVE_RIGHT.real;
      offset += sizeof(this->MOVE_RIGHT);
      union {
        bool real;
        uint8_t base;
      } u_MOVE_FORWARD;
      u_MOVE_FORWARD.base = 0;
      u_MOVE_FORWARD.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->MOVE_FORWARD = u_MOVE_FORWARD.real;
      offset += sizeof(this->MOVE_FORWARD);
      union {
        bool real;
        uint8_t base;
      } u_CATCH_OR_NOT;
      u_CATCH_OR_NOT.base = 0;
      u_CATCH_OR_NOT.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->CATCH_OR_NOT = u_CATCH_OR_NOT.real;
      offset += sizeof(this->CATCH_OR_NOT);
     return offset;
    }

    const char * getType(){ return "tele_doll_catcher/Catcher"; };
    const char * getMD5(){ return "0007f92c016629160356ca5642bbf6b7"; };

  };

}
#endif