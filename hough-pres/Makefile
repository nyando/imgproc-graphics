METADATA_FILE := meta.yml
MD_FILE := pres.md
OUTPUT_FILE := pres.pdf

pres:
	pandoc -t beamer --metadata-file=$(METADATA_FILE) $(MD_FILE) -o $(OUTPUT_FILE)
