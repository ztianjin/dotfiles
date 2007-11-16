
(setq gnus-select-method '(nnnil ""))
(setq gnus-secondary-select-methods '((nnml ""
					    (nnml-directory "~/Mail"))))

(setq gnus-home-directory "~/.emacs.d")
(setq user-mail-address "phil@hagelb.org")
(setq user-full-name "Phil Hagelberg")
(setq gnus-ignored-from-addresses "Phil Hagelberg")

;; Now with SSL!
(setq smtpmail-starttls-credentials '(("mail.hagelb.org" 587 nil nil))
      smtpmail-smtp-server "mail.hagelb.org"
      smtpmail-default-smtp-server "mail.hagelb.org"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("mail.hagelb.org"
				   587
				   "m7139145"
				   "testyy")))

(setq message-kill-buffer-on-exit t)

(setq gnus-message-archive-group "sent")
(setq gnus-fetch-old-headers 'some)
(setq nnmail-split-methods 'nnmail-split-fancy)
(setq nnmail-crosspost nil)

(setq nnmail-split-fancy
      '(| (to "ruby-talk@ruby-lang\\.org" "ruby-talk")
	  (to "ruby_emacs_dev@yahoogroups\\.com" "emacs-rails")
	  (to "rubyonrails-talk@googlegroups.com" junk)
	  ("subject" "^\\[Rails\\]" junk)
	  (to "obby-users@list.0x539.de" "obby-users")
	  (from "rspec" junk)
	  (any "darjeeling" "darjeeling")
	  (any "conkeror" "conkeror")
	  (any "zenspider\\.com" "seattle.rb")
	  (any "mozlab" "mozlab")
	  (any "dbus" "dbus")
	  (any "cartographer" junk)
	  (any "ocruby" junk)
	  (any "helma" "helma")
	  (any "utuprotocol" "utu")
	  (any "emacs-devel" "emacs-devel")
	  (any "team@circlebuilder\.com" junk)
	  (any "philh@paxtel" junk)
	  (any "cron" junk)

	  (any "zacchaeus.*" "friends")

	  (any "alisha\\.e\\.hagelberg@biola\\.edu" "alisha")
	  (from "agelberg" - "Alisha" "family")

	  (any ".*hackelford.*" "friends")
	  (any ".*peckham.*" "friends")
	  (any ".*carroll.*" "friends")
	  (any ".*guenther.*" "friends")
	  (any ".*rowley.*" "friends")
	  (any ".*malabuyo.*" "friends")
	  (any ".*holloway.*" "friends")

	  (any "Benjamin Bryan" "friends")
	  (any "Arko" "friends")
	  (any "Joel Watson" "friends")
	  "inbox"))

(setq mail-sources '((file :path "/var/mail/phil")))

(setq imap-ssl-program "/usr/bin/openssl s_client -ssl3 -connect %s:%p")
(setq gnus-agent-expire-days 0)
(setq gnus-agent-enable-expiration 'DISABLE)

(gnus-demon-add-handler 'gnus-group-get-new-news 10 t)
(gnus-demon-init)

(add-hook 'message-mode-hook 'auto-fill-mode)
(add-hook 'message-mode-hook 'flyspell-mode)

(setq gnus-summary-line-format
      (concat
       "%{|%}"
       "%U%R%z"
       "%{|%}"
       "%(%-18,18f"
       "%{|%}"
       "%*%{%B%} %s%)"
       "\n"))

(when (require 'nnir nil t)
  (setq nnir-search-engine 'namazu)
  (setq nnir-namazu-index-directory
        (expand-file-name "~/.namazu"))
  (setq nnir-namazu-remove-prefix
        (expand-file-name "~/Mail/"))
  (setq nnir-mail-backend (nth 0 gnus-secondary-select-methods)))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-use-full-window nil)

(mailcap-add "image/jpeg" "display")

;; (setq gnus-buffer-configuration 
;;       '((group (vertical 1.0 (group 1.0 point)))
;; 	(summary (vertical 1.0 (summary 1.0 point)))
;; 	(article (horizontal 1.0 (summary 1.0 point)
;; 			   (article 80)))))
