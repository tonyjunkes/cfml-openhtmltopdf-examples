# CFML OpenHTMLToPDF Examples

Examples demonstrating the [OpenHTMLToPDF Java library](https://github.com/danfickle/openhtmltopdf) in CFML.

> NOTE: This is a work in progress and each example added will be accompanied by a blog post at https://tonyjunkes.com.

## Installation

### CommandBox

[CommandBox](https://www.ortussolutions.com/products/commandbox) is the recommended way to run this project's examples.

Launch a terminal pointing at the project root and run `box` to get CommandBox going. Then run `install && start` to pull in the Java dependencies and start the server instance. By default the latest available flavor of Lucee will be used. To switch engines, you may pass in the `cfengine` parameter to CommandBox or update `server.json` in the project root.

### Manual

A list of Java dependencies is listed in `box.json`. Follow the JAR links to manually download the required dependencies. Place those files in `/lib` of the project root. From there you can run the project using the engine of your choice.