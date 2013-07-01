(in-package :gui)

(defvar *system* 
  (list (cons 'сисадмин (main:make-сисадмин))
	(cons 'кабель (main:make-кабель))
	(cons 'коннектор (main:make-коннектор))
	(cons 'патчкорд (main:make-патчкорд))
	(cons 'кримпер (main:make-кримпер))))

(defun main-window ()
  (with-ltk ()
    (let* ((patсhcord (make-instance 'labelframe :text "Патчкорд" :width 200 :height 200))
	   ;; Patchcord parameters
	   (pc-purpose (make-instance 'listbox :master patсhcord))	
	   (pc-ready (make-instance 'check-button :master patсhcord :text "Готов"))
	   (pc-has-cable (make-instance 'check-button :master patсhcord :text "Состоит из кабеля"))
	   (pc-has-connector (make-instance 'check-button :master patсhcord :text "Состоит из коннектора"))
	   ;; Cable and it's parameters
	   (cable (make-instance 'labelframe :text "Кабель" :width 200 :height 200))
	   (cb-type (make-instance 'listbox :master cable))
	   (cb-ready (make-instance 'check-button :master cable :text "Готов"))
	   (cb-measured (make-instance 'check-button :master cable :text "Отмерен"))
	   (cb-stripped (make-instance 'check-button :master cable :text "Зачищен"))
	   (cb-cut (make-instance 'check-button :master cable :text "Отрезан"))
	   (cb-crimped (make-instance 'check-button :master cable :text "Обжат"))
	   ;; Crimper parameters
	   (crimper (make-instance 'labelframe :text "Кримпер" :width 200 :height 200))
	   (cr-clamped (make-instance 'check-button :master crimper :text "Зажат"))
	   (cr-rotated (make-instance 'check-button :master crimper :text "Повернут"))
	   ;; Connector parameters
	   (connector (make-instance 'labelframe :text "Коннектор" :width 200 :height 200))
	   (co-installed (make-instance 'check-button :master connector :text "Установлен на кабель"))
	   (co-put-on (make-instance 'check-button :master connector :text "Надет на кабель"))
	   (co-inserted (make-instance 'check-button :master connector :text "Вставлен в кримпер"))

	   ;;; Action buttons
	   (buttons (make-instance 'frame))
	   (prepare-cable (make-instance 'button :text "Подготовить кабель" :master buttons))

	   (select-type (make-instance 'button :text "Выбрать тип" :master buttons))
	   (measure-cable (make-instance 'button :text "Отмерить кабель" :master buttons))
	   (cut-cable (make-instance 'button :text "Отрезать кабель" :master buttons))
	   (strip-cable (make-instance 'button :text "Зачистить кабель" :master buttons))

	   (insert-cable (make-instance 'button :text "Вставить кабель" :master buttons))
	   (clamp-crimper (make-instance 'button :text "Зажать кабель" :master buttons))
	   (rotate-crimper (make-instance 'button :text "Повернуть кримпер" :master buttons))
	   (unclamp-crimper (make-instance 'button :text "Разжать кабель" :master buttons))
	   (remove-cable (make-instance 'button :text "Вынуть кабель" :master buttons))

	   (install-connector (make-instance 'button :text "Установить коннектор" :master buttons))
	   (put-connector-on (make-instance 'button :text "Надеть коннектор" :master buttons))
	   (crimp-cable (make-instance 'button :text "Обжать кабель" :master buttons))

	   (insert-connector (make-instance 'button :text "Вставить коннектор в кримпер" :master buttons))
	   (clamp-crimper-connector (make-instance 'button :text "Сжать кримпер" :master buttons))
	   (unclamp-crimper-connector (make-instance 'button :text "Разжать кримпер" :master buttons))
	   (remove-connector (make-instance 'button :text "Вынуть коннектор" :master buttons))

	   (quit (make-instance 'button :text "Выход"
				:command (lambda ()
					   (setf *exit-mainloop* t)))))
      (grid patсhcord 0 0 :rowspan 4 :columnspan 4 :sticky "nws")
      (listbox-append pc-purpose "Для обычных систем")
      (listbox-append pc-purpose "Для высоконагруженных систем")
      (grid pc-purpose 0 0 :sticky "nw")
      (grid pc-ready 1 0 :sticky "nw")
      (grid pc-has-cable 2 0 :sticky "nw")
      (grid pc-has-connector 3 0 :sticky "nw")

      (grid cable 0 4 :rowspan 4 :columnspan 4 :sticky "nws")
      (grid cb-type 0 0 :sticky "nw")
      (grid cb-ready 1 0 :sticky "nw")
      (grid cb-measured 2 0 :sticky "nw")
      (grid cb-measured 3 0 :sticky "nw")
      (grid cb-stripped 4 0 :sticky "nw")
      (grid cb-cut 5 0 :sticky "nw")
      (grid cb-crimped 6 0 :sticky "nw")

      (grid crimper 4 0 :rowspan 4 :columnspan 4 :sticky "nwse")
      (grid cr-clamped 0 0 :sticky "nw")
      (grid cr-rotated 1 0 :sticky "nw")
	     
      (grid connector 4 4 :rowspan 4 :columnspan 4 :sticky "nwse")
      (grid co-installed 0 0 :sticky "nw")
      (grid co-put-on 1 0 :sticky "nw")
      (grid co-inserted 2 0 :sticky "nw")

      (grid buttons 0 8)
      (grid prepare-cable 0 0 :sticky "nwe")
      (grid select-type 2 0 :sticky "nwe")
      (grid measure-cable 3 0 :sticky "nwe")
      (grid cut-cable 4 0 :sticky "nwe")
      (grid strip-cable 5 0 :sticky "nwe")
      (grid insert-cable 6 0 :sticky "nwe")
      (grid clamp-crimper 7 0 :sticky "nwe")
      (grid rotate-crimper 8 0 :sticky "nwe")
      (grid unclamp-crimper 9 0 :sticky "nwe")
      (grid remove-cable 10 0 :sticky "nwe")
      (grid install-connector 11 0 :sticky "nwe")
      (grid put-connector-on 12 0 :sticky "nwe")
      (grid crimp-cable 13 0 :sticky "nwe")
      (grid insert-connector 14 0 :sticky "nwe")
      (grid clamp-crimper-connector 15 0 :sticky "nwe")
      (grid unclamp-crimper-connector 16 0 :sticky "nwe")
      (grid remove-connector 17 0 :sticky "nwe")

      (grid quit 8 0 :columnspan 8 :sticky "we"))))


