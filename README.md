# Gispo Training Repository

This is a repository hosting Gispo's training materials.

## Editing content

The course materials are written and edited in R Markdown (.rmd) files which are then automatically rendered to HTML using [Bookdown](https://bookdown.org). The materials are in the 'src' folder in which each course is in its own folder named after its course code. English and Swedish translations of courses have a suffix, '_eng', or '_sv' respectively. Editing or adding new rmd files or image files in the course's folder will trigger a workflow which will render the course to HTML and either add or modify the corresponding course folder in the 'docs' folder. The docs folder is published using GitHub pages.

Using RStudio to edit the rmd files is recommended. You can install the bookdown package and preview the HTML document using RStudio. If you have Docker installed, you can also render locally using the [render.sh](render.sh) ([render.ps1](render.ps1) on Windows) script.

For Windows, you may need to enable script support first.
Open Powershell as an administrator and run the command `Set-ExecutionPolicy RemoteSigned`.

## Editing the assets

The HTML is rendered using custom HTML and CSS templates defined in the index.Rmd YAML header. Some extra functionality (f.e. copying the contents of a code box) is added with javascript (.js) files. These can be found and added to the 'js' folder. They also might have to be added to the end of the HTML template.

If you wish to edit the assets, for example change the style of the pages or add functionality with javascript you can edit the files in the assets folder. When you make changes to the assets folder a workflow is triggered which updates the assets automatically to each course folder in 'src'.

## Rendering

The [index.Rmd](src/index.Rmd) file is a special file that always gets rendered first
Other Rmd files get rendered in alphabetic order to separate pages.
Use the YAML header section (separated by `---`) of index.Rmd to define a author, title, and abstract for the materials.
<!-- ## Repository configuration

After creating a new repository from this template, two steps are required to publish the course materials online.

First, add a new *repository secret* to allow GitHub to automatically render and commit the materials.
In order to do this, you need to have a [GitHub access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with `repo` scope.
After generating an access token, add a new repository secret **in the newly created repository** by clicking Settings - Secrets - New repository secret.
Create a new secret with the name `ACCESS_TOKEN`, paste in your access token to the value field and click Add secret.

Second, publish the new repository on GitHub pages.
**In the new repository**, click on Settings - Pages.
Under the Source section, Select the `main` branch, choose the `/docs` root directory, and click Save.
GitHub will provide you with an URL where the course materials are automatically published after rendering.

## Editing content

The course materials are written using R Markdown and rendered to HTML using [Bookdown](https://bookdown.org).
Editing the .Rmd files triggers a GitHub workflow that renders the materials to the [docs/](docs) directory.
See the [Bookdown documentation](https://bookdown.org) for instructions on Rmd syntax.

You can also render locally with Docker using the [render.sh](render.sh) ([render.ps1](render.ps1) on Windows) script.
For Windows, you may need to enable script support first.
Open Powershell as an administrator and run the command `Set-ExecutionPolicy RemoteSigned`.

## Rendering

The [index.Rmd](src/index.Rmd) file is a special file that always gets rendered first
Other Rmd files get rendered in alphabetic order to separate pages.
Use the YAML header section (separated by `---`) of index.Rmd to define a author, title, and abstract for the materials.

The HTML is rendered using custom HTML and CSS templates defined in the index.Rmd YAML header.
By default, these are [src/custom.html](src/custom.html) and [src/custom.css](src/custom.css).
Edit the template files to change the layout and appearance of the output.

Always preview the affect of changes to template files before committing changes.
This can be done by rendering the output HTML locally using [render.sh](render.sh).
After rendering, navigate to the out directory, start a http server (`python -m http.server`), and open [http://localhost:8000](http://localhost:8000). -->
