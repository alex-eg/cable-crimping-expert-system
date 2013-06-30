(in-package :cl-user)

(defpackage :sys-asd
  (:use :cl :asdf))

(in-package :sys-asd)

(defsystem :sys
  :serial t
  :components ((:file "packages")
	       (:file "main")
	       (:file "gui"))
  :depends-on (:ltk))

