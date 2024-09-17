### Note.

- The library is compatible with React and Angular applications.
- In the near future, the library will be compatible with all front-end applications.

# Installation & Usage

<h3>

1. Installation of the package on your Angular project.

```
npm install saturn-css
```

2. Script execution for install & update.

```
npm run saturn
```

# Description.

This library promotes atomic design, which involves breaking down user interfaces into elementary components called atoms, molecules, organisms, etc..

This approach fosters code reusability, consistency, and maintainability. The design system file provides the necessary basic elements for building these atoms and their associated components by defining their structure and style.

However, when assembling website pages, it may be necessary to adjust certain visual or functional aspects of the components without altering their basic structure. This is where the library comes into play: by providing a set of additional CSS classes, it allows for the rapid application of predefined styles for elements such as margins, spacing, positioning, etc.

The library and the design system work in synergy, offering a comprehensive and modular approach for frontend development, where the atoms defined in the design system serve as a solid foundation to which the library's classes add functionality and styles specific to the usage context.

Documentation : https://saturn-css.3a1d.com/

# Operation.

1. The installation of the package from the root of your Angular project via **Node Package Manager** is mandatory for using the library.

2. To install the library in your Angular project, execute the second command from the root of your application. Each time you wish to update the library, there is no need to repeat step 1; simply execute the second command.

# Details.


> 1. Package installation.

- _+1 file_ package.json
- _+1 file_ README.md
- _+1 file_ script.sh
- _+1 file_ install.js
- _+1 file_ LICENSE

> 2.  Executing the script from the command line.

#### if Angular application :
- Transfer of the _file_ **saturn.css** to the project _folder_.
- Creation of a _file_ **script.js**.
- Execution of the **script.js**.
- Addition of the absolute path of the _file_ **saturn.css** in **angular.json**.
- Permanent deletion of the _file_ **script.js**.

#### if React application :
- Transfer of the _file_ **saturn.css** to the project _folder_.
- Creation of a _file_ **script.js**.
- Execution of the **script.js**.
- Addition of the absolute path of the _file_ **saturn.css** in **main.jsx**.
- Permanent deletion of the _file_ **script.js**.

### Credits.
*The style library and all installation scripts were developed by [ Nassime HARMACH ](https://www.linkedin.com/in/nassime-harmach/) and edited by 3A1D.*
*All related code is open source.*