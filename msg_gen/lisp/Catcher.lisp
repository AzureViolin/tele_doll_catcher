; Auto-generated. Do not edit!


(cl:in-package tele_doll_catcher-msg)


;//! \htmlinclude Catcher.msg.html

(cl:defclass <Catcher> (roslisp-msg-protocol:ros-message)
  ((moveTLR
    :reader moveTLR
    :initarg :moveTLR
    :type cl:fixnum
    :initform 0)
   (moveTFB
    :reader moveTFB
    :initarg :moveTFB
    :type cl:fixnum
    :initform 0)
   (MOVE_RIGHT
    :reader MOVE_RIGHT
    :initarg :MOVE_RIGHT
    :type cl:boolean
    :initform cl:nil)
   (MOVE_FORWARD
    :reader MOVE_FORWARD
    :initarg :MOVE_FORWARD
    :type cl:boolean
    :initform cl:nil)
   (CATCH_OR_NOT
    :reader CATCH_OR_NOT
    :initarg :CATCH_OR_NOT
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Catcher (<Catcher>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Catcher>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Catcher)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_doll_catcher-msg:<Catcher> is deprecated: use tele_doll_catcher-msg:Catcher instead.")))

(cl:ensure-generic-function 'moveTLR-val :lambda-list '(m))
(cl:defmethod moveTLR-val ((m <Catcher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_doll_catcher-msg:moveTLR-val is deprecated.  Use tele_doll_catcher-msg:moveTLR instead.")
  (moveTLR m))

(cl:ensure-generic-function 'moveTFB-val :lambda-list '(m))
(cl:defmethod moveTFB-val ((m <Catcher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_doll_catcher-msg:moveTFB-val is deprecated.  Use tele_doll_catcher-msg:moveTFB instead.")
  (moveTFB m))

(cl:ensure-generic-function 'MOVE_RIGHT-val :lambda-list '(m))
(cl:defmethod MOVE_RIGHT-val ((m <Catcher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_doll_catcher-msg:MOVE_RIGHT-val is deprecated.  Use tele_doll_catcher-msg:MOVE_RIGHT instead.")
  (MOVE_RIGHT m))

(cl:ensure-generic-function 'MOVE_FORWARD-val :lambda-list '(m))
(cl:defmethod MOVE_FORWARD-val ((m <Catcher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_doll_catcher-msg:MOVE_FORWARD-val is deprecated.  Use tele_doll_catcher-msg:MOVE_FORWARD instead.")
  (MOVE_FORWARD m))

(cl:ensure-generic-function 'CATCH_OR_NOT-val :lambda-list '(m))
(cl:defmethod CATCH_OR_NOT-val ((m <Catcher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_doll_catcher-msg:CATCH_OR_NOT-val is deprecated.  Use tele_doll_catcher-msg:CATCH_OR_NOT instead.")
  (CATCH_OR_NOT m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Catcher>) ostream)
  "Serializes a message object of type '<Catcher>"
  (cl:let* ((signed (cl:slot-value msg 'moveTLR)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'moveTFB)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'MOVE_RIGHT) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'MOVE_FORWARD) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'CATCH_OR_NOT) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Catcher>) istream)
  "Deserializes a message object of type '<Catcher>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'moveTLR) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'moveTFB) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'MOVE_RIGHT) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'MOVE_FORWARD) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'CATCH_OR_NOT) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Catcher>)))
  "Returns string type for a message object of type '<Catcher>"
  "tele_doll_catcher/Catcher")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Catcher)))
  "Returns string type for a message object of type 'Catcher"
  "tele_doll_catcher/Catcher")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Catcher>)))
  "Returns md5sum for a message object of type '<Catcher>"
  "0007f92c016629160356ca5642bbf6b7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Catcher)))
  "Returns md5sum for a message object of type 'Catcher"
  "0007f92c016629160356ca5642bbf6b7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Catcher>)))
  "Returns full string definition for message of type '<Catcher>"
  (cl:format cl:nil "int16 moveTLR~%int16 moveTFB~%bool MOVE_RIGHT ~%bool MOVE_FORWARD~%bool CATCH_OR_NOT~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Catcher)))
  "Returns full string definition for message of type 'Catcher"
  (cl:format cl:nil "int16 moveTLR~%int16 moveTFB~%bool MOVE_RIGHT ~%bool MOVE_FORWARD~%bool CATCH_OR_NOT~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Catcher>))
  (cl:+ 0
     2
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Catcher>))
  "Converts a ROS message object to a list"
  (cl:list 'Catcher
    (cl:cons ':moveTLR (moveTLR msg))
    (cl:cons ':moveTFB (moveTFB msg))
    (cl:cons ':MOVE_RIGHT (MOVE_RIGHT msg))
    (cl:cons ':MOVE_FORWARD (MOVE_FORWARD msg))
    (cl:cons ':CATCH_OR_NOT (CATCH_OR_NOT msg))
))
