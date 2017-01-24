;;; monz.el --- Personal Blog Editing Mode for Emacs
;; -*- Mode: Emacs-Lisp -*-

;; Copyright (C) 2017 Masayuki Ataka <masayuki.ataka@gmail.com>

;; Author: Masayuki Ataka <masayuki.ataka@gmail.com>
;; URL: https://github.com/ataka/monz

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, you can either send email to this
;; program's maintainer or write to: The Free Software Foundation,
;; Inc.; 59 Temple Place, Suite 330; Boston, MA 02111-1307, USA.

;;; Commentary:

;; monz.el provides a major mode for editig private blog.

;; monz is first written in Project MONoZukuri-Bu.

;;; Code:

(define-derived-mode monz-mode
  nxml-mode "Monz"
  "Major mode for editing personal blog.
\\{monz-mode-map}"
  )

(define-key monz-mode-map "\M-\C-i"  'nxml-complete)
(define-key monz-mode-map "\C-c\C-e" 'monz-insert-tag)
(define-key monz-mode-map "\C-c\C-p" 'monz-insert-paragraph)

;;
;; Edit
;;
(defun monz-insert-paragraph ()
  "Insert paragraph element"
  (interactive)
  (insert "<p")
  (call-interactively 'nxml-balanced-close-start-tag-inline))

(defun monz-insert-tag ()
  "Insert HTML tag"
  (interactive)
  (insert "<")
  (call-interactively 'nxml-complete)
  (nxml-balanced-close-start-tag-inline))

(provide 'monz)

;;; monz.el ends here
