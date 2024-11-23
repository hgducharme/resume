BUILD_DIR=build

.PHONY: resume clean

resume:
	mkdir -p $(BUILD_DIR)
	@lualatex -synctex=1 -file-line-error -jobname=resume -output-directory=$(BUILD_DIR) -recorder "resume.tex"

clean:
	rm -r $(BUILD_DIR)