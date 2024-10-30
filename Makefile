.PHONY: resume

resume:
	@lualatex -synctex=1 -file-line-error -jobname=resume -output-directory=build -recorder "resume.tex"