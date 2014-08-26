.PHONY: clean

all: resume asciidoc

resume: res.cls resume.tex
	pdflatex resume.tex

asciidoc: resume.tex asciidoc.template
	sed 's/[[:space:]]\\hfill[[:space:]]/; /g' resume.tex > resume.tmp.tex
	pandoc -s resume.tmp.tex -o README.asciidoc --template asciidoc.template
	rm resume.tmp.tex

hook:
	cp pre-commit .git/hooks/pre-commit
	chmod a+x .git/hooks/pre-commit

clean:
	rm -f *.log
	rm -f *.aux
