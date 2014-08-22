.PHONY: clean

all: resume org

resume: res.cls resume.tex
	pdflatex resume.tex

org: resume.tex org.template
	pandoc -s resume.tex -o README.org --template org.template

hook:
	cp pre-commit .git/hooks/pre-commit
	chmod a+x .git/hooks/pre-commit

clean:
	rm -f *.log
	rm -f *.aux
