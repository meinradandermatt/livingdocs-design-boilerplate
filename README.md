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
"label": "Boilerplate Design",
"version": "1.0.0",
"author": "upfront.io"
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

Inside of the folder `src/components` you can define HTML components that can be used in documents that use your design. These components will be automatically inserted into `dist/design.json` when you run `grunt build`.

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


## Default Components

The `defaultComponents` configuration tells the editor which components should be used by default for some basic interactions like Pressing Enter at the end of a paragraph. Since Livingdocs is completely configurable you can for example define what your standard text paragraph looks like.

```json
"defaultComponents": {
  "paragraph": "p", // The default component to insert when pressing Enter
  "image": "image"  // The component to insert when dragging an image into the document.
}
```


## Component Properties

The settings in `componentProperties` will add configuration options to your components. Technically a componentProperty will just add a css class to the top level element of a component if it is selected by the user. You can use these properties in one of your components as shown further below.

```json
"componentProperties": {

  // Dropcap that will add the css class 'drop-cap' to a component if selected
  "dropcap": {
    "label": "Drop Capital",
    "type": "option",
    "value": "drop-cap"
  },

  // Position property that lets the user choose to add either the css class 'position-left' or 'position-right' to a component.
  "position": {
    "label": "Position",
    "type": "select",
    "options": [
      {
        "caption": "Default"
      },
      {
        "caption": "Left",
        "value": "position-left"
      },
      {
        "caption": "Right",
        "value": "position-right"
      }
    ]
  },
}
```

This is an example configuration of a paragraph component that uses the `dropcap` componentProperty so the user can check a checkbox in the user interface if they want to have a dropcap at the beginning of their paragraph.

```html
<script type="ld-conf">
{
  "label": "Paragraph",
  "properties": ["dropcap"]
}
</script>

<p doc-editable="text">
  Lorem Ipsum...
</p>
```


## Groups

For the User interface you can group your components. This is done via the `groups` configuration. These are purely instructions for the user interface how to display a grouped list of components to the user.

```json
"groups": [
  {
    "label": "Headers",
    "components": ["hero", "head", "title"]
  }, {
    "label": "Text",
    "components": ["subtitle", "p", "quote", "aside"]
  }, {
    "label": "Images",
    "components": ["image", "peephole"]
  }
],
```


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

