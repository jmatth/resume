.PHONY: clean

resume: res.cls resume.tex
	pdflatex resume.tex

org: resume.tex org.template
	pandoc -s resume.tex -o README.org --template org.template

clean:
	rm -f *.log
	rm -f *.aux
