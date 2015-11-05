# markdown-resume
My CSS and Makefile for a resume in Markdown. See my blog post for more details.

## How To

### Install Dependencies

* Install `multimarkdown` and `wkhtmltopdf`
    - If you're on a mac:
        + `brew install multimarkdown`
        + `brew install cask`
        + `brew cask install wkhtmltopdf`
    - If you're not on a mac do the equivalent with your package manager or something, you're smart.

You can either clone this repository and directly modify `resume.md`, or add this repository as a submodule to a repository containing your markdown resume.

To keep your resume in a separate repository, add this repository as a submodule:

`git submodule add git@github.com:Pretz/markdown-resume.git`

Create a Makefile which imports the included Makefile and sets variables if needed:

```make
UPLOAD_DEST = apple.com:~johnny/html_public/resume/
RESUME_FILE = johnny-resume.md
DEST_FILE = index.html

include markdown-resume/Makefile
```

### Run

* `make` to generate HTML
* `make pdf` to generate a PDF
* `make deploy` to scp the HTML and CSS to your configured web server