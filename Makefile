RESUME_FILE ?= resume.md
SUBMODULE ?= markdown-resume
UPLOAD_DEST ?= example.com:resume/
DEST_FILE ?= resume.html
CSS ?= $(firstword $(wildcard resume.css $(SUBMODULE)/resume.css))

resume.html: $(RESUME_FILE)
	multimarkdown -o resume.html resume.md

deploy: resume.html
	chmod a+r resume.html $(CSS)
	scp resume.html $(UPLOAD_DEST)/$(DEST_FILE)
	scp $(CSS) $(UPLOAD_DEST)/resume.css

pdf: resume.html
	wkhtmltopdf --print-media-type resume.html resume.pdf

setup:
	ln -s $(SUBMODULE)/resume.css resume.css