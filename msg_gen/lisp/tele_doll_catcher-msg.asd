
(cl:in-package :asdf)

(defsystem "tele_doll_catcher-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Catcher" :depends-on ("_package_Catcher"))
    (:file "_package_Catcher" :depends-on ("_package"))
  ))