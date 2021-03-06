;;; -*- mode: scheme; coding: utf-8; -*-
;;;
;;; odbc.scm - ODBC interface
;;;  
;;;   Copyright (c) 2010-2015  Takashi Kato  <ktakashi@ymail.com>
;;;   
;;;   Redistribution and use in source and binary forms, with or without
;;;   modification, are permitted provided that the following conditions
;;;   are met:
;;;   
;;;   1. Redistributions of source code must retain the above copyright
;;;      notice, this list of conditions and the following disclaimer.
;;;  
;;;   2. Redistributions in binary form must reproduce the above copyright
;;;      notice, this list of conditions and the following disclaimer in the
;;;      documentation and/or other materials provided with the distribution.
;;;  
;;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;;   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;;   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;;   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;;   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;;   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;;   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;;   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;;   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;;   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;;   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;  

(library (odbc)
    (export create-odbc-env
	    connect!
	    driver-connect!
	    set-connect-attr!
	    disconnect!
	    connection-open?
	    free-handle!
	    statement
	    prepare
	    statement-open?
	    num-params
	    bind-parameter!
	    execute!
	    execute-direct!
	    fetch!
	    get-data
	    row-count
	    column-size
	    column-count
	    result-columns
	    commit!
	    rollback!
	    ;; meta info
	    tables
	    columns
	    ;; predication
	    odbc-env?
	    odbc-connection?
	    odbc-statement?

	    odbc-date?
	    odbc-time?
	    odbc-timestamp?

	    ;; converter
	    odbc-date->date
	    odbc-time->time
	    odbc-timestamp->date
	    ;; clos
	    <odbc-ctx> <odbc-date>

	    ;; constant variables
	    ;; table type
	    +table-type-table+
	    +table-type-view+
	    +table-type-system-table+
	    +table-type-global-temporary+
	    +table-type-local-temporary+
	    +table-type-alias+
	    +table-type-synonym+
	    )
    (import (rnrs)
	    (sagittarius)
	    (core conditions)
	    (srfi :19 time))
  (load-dynamic-library "sagittarius--odbc")

  (initialize-builtin-condition &odbc-error &error)

  (define-constant +table-type-table+ "TABLE")
  (define-constant +table-type-view+  "VIEW")
  (define-constant +table-type-system-table+ "SYSTEM TABLE")
  (define-constant +table-type-global-temporary+ "GLOBAL TEMPORARY")
  (define-constant +table-type-local-temporary+ "LOCAL TEMPORARY")
  (define-constant +table-type-alias+ "ALIAS")
  (define-constant +table-type-synonym+ "SYNONYM")

  (define (odbc-date->date date)
    (or (odbc-date? date)
	(assertion-violation 'odbc-date->date
			     (format "odbc-date required but got ~a" date)
			     date))
    (make-date 0 0 0 0
	       (odbc-date-day date)
	       (odbc-date-month date)
	       (odbc-date-year date)
	       (date-zone-offset (current-date))))

  (define (odbc-time->time time)
    (or (odbc-time? time)
	(assertion-violation 'odbc-time->time
			     (format "odbc-time required but got ~a" time)
			     time))
    (make-time time-monotonic
	       (+ (* (odbc-time-hour time) 3600)
		  (* (odbc-time-minute time) 60)
		  (odbc-time-second time))
	       0))

  (define (odbc-timestamp->date timestamp)
    (or (odbc-timestamp? timestamp )
	(assertion-violation 'odbc-timestamp?
			     (format "odbc-timestamp required but got ~a" timestamp)
			     timestamp))
    (make-date (odbc-timestamp-fraction timestamp)
	       (odbc-timestamp-second timestamp)
	       (odbc-timestamp-minute timestamp)
	       (odbc-timestamp-hour timestamp)
	       (odbc-timestamp-day timestamp)
	       (odbc-timestamp-month timestamp)
	       (odbc-timestamp-year timestamp)
	       (date-zone-offset (current-date))))
)
