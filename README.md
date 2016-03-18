This is the LaTeX template for thesis and seminars of the Softlang team of the university Koblenz-Landau.

The template is for pdfTex, but feel free to use other engines luatex or xetex.
LateX is document markup language widely used in computer science. The documents are written in plain text and a tex engine produces an output document in pdf format.
Common tex distribution are TeX Live (https://www.tug.org/texlive/) and MikTeX (http://miktex.org/).
I recommend as a proper LaTeX introduction https://tobi.oetiker.ch/lshort/lshort.pdf

This project provides a new document type "softlang" and example document structure.
Each tex file has comments describing the purpose of the file:
-ausarbeitung.tex: Root and Settings for the whole document like title, name, bib file, imported packages.
   This file doesn't have any content itself, it produces indecis, table of contents, title page 
   and  includes other tex files for the content.  
-abstract.tex: The abstract in german and english.
-content.tex: This file imports the content from the content/....tex documents.
   When you want to add a new content file add an "include{content/example.tex}" in proper order to this file 
-sources.bib: This file contain all bibtex references to include in your document
-logos: University of Koblenz-Landau logo and softlang logo
-images: images for your document to include
-content: content folder, each tex file is a chapter of the document

Instructions (Mac,Linux):
1. Install a LaTeX distribution
2. Edit tex files
3. Run 'make'
Make produces a new ausarbeitung.pdf and some auxiliary files. You can delete these auxiliary files.