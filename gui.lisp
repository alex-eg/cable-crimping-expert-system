(in-package :gui)

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
	   (prepare-cable (make-instance 'button :text "Подготовить кабель"))

	   (select-type (make-instance 'button :text "Выбрать тип"))
	   (measure-cable (make-instance 'button :text ""))
	   (cut-cable (make-instance 'button :text ""))
	   (strip-cable (make-instance 'button :text ""))

	   (insert-cable (make-instance 'button :text ""))
	   (clamp-crimper (make-instance 'button :text ""))
	   (rotate-crimper (make-instance 'button :text ""))
	   (unclamp-crimper (make-instance 'button :text ""))
	   (remove-cable (make-instance 'button :text ""))

	   (install-connector (make-instance 'button :text ""))
	   (put-connector-on (make-instance 'button :text ""))
	   (crimp-cable (make-instance 'button :text ""))

	   (insert-connector (make-instance 'button :text ""))
	   (clamp-crimper-connector (make-instance 'button :text ""))
	   (unclamp-crimper-connector (make-instance 'button :text ""))
	   (remove-connector (make-instance 'button :text ""))

	   (quit (make-instance 'button :text "Quit"
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

      (grid quit 8 7))))

