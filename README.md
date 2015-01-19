Livingdocs Design
=================

This project is a boilerplate design for Livingdocs ([Documentation](https://github.com/upfrontIO/livingdocs)) - you can fork to create your own designs.


## Project structure

The design is stored in the `src` directory.
A design consists of the following files:

    src/config.json    // design configuration file,             required
    src/components/    // the components of a design,            required
    src/stylesheets/   // stylesheets of a design,               required
    src/images/        // images belonging to a design,          optional
    src/index.html     // preview of the design in development,  optional


## config.json

The config.json defines the design configuration. You can specifiy through the design configuration what options are available and how components behave when editing in the Livingdocs editor.

Basic Information:

```json
"name": "boilerplate",
"version": "0.0.1",
"author": "Peter Pan",
```


### Css

You can put your stylesheets inside of the `src/stylesheets` folders. How your css works and whether you use sass or less to generate it is up to you. 

Define the stylesheets that are needed by your design in the `config.json` so that Livingdocs can laod them dynamically into the editor.

```json
"assets": {
  "css": ["./stylesheets/boilerplate.css"]
},
```


## Components

Inside of the folder `src/components` you can define HTML components that can be used in documents that use your design.

For every component you can create a new file. Here is an example for a paragraph:

```html
<script type="ld-conf">
{
  "label": "Paragraph"
}
</script>

<p doc-editable"text">
  Lorem Ipsum...
</p>
```

Inside of the `<script type="ld-conf">` you can define configurations for the components. The component itself is built with normal HTML and Livindocs specific attributes indicate to Livingdocs what content the user can change and edit. The attribute `doc-editable` will turn the paragraph into an editable element.


## How to export your design

The design is compiled using `grunt build` and previewed using `grunt dev`. The build folder is `/dist` and the build structure is as follows:

    dist/design.js        // the design configuration as a js file
    dist/design.json      // the design configuration as json
    dist/images/          // images are copied
    dist/stylesheets/     // stylesheets are to css and then copied


## Installation

Install [node.js](http://nodejs.org/) and [grunt](http://gruntjs.com/installing-grunt) 

  1. From the root of the project run `npm install`
  2. Run `grunt dev` to compile the design. When a file changes, the files in **/dist** folder are updated automatically

