
CURRENT_PROJECT=$(pwd)
CURRENT_PROJECT_SOURCE="$CURRENT_PROJECT/src"
PACKAGE_JSON_FILE="$CURRENT_PROJECT/package.json"
FOLDER_LIBRARY="$CURRENT_PROJECT/node_modules/saturn-css"
STYLE_FILE="$FOLDER_LIBRARY/saturn.css"
SCRIPT_SH="$FOLDER_LIBRARY/script.sh"
SCRIPT_JS="$CURRENT_PROJECT/script.js"
ANGULAR_FILE="$CURRENT_PROJECT/angular.json"
REACT_FILE="$CURRENT_PROJECT_SOURCE/main.jsx"

function move_style_file_on_project {
  if [ -f "$CURRENT_PROJECT_SOURCE/saturn.css" ]; then
    echo "❌ The library is already installed on your project."
  else
    cp "$STYLE_FILE" "$CURRENT_PROJECT_SOURCE/saturn.css"
    echo "🆗 The library has been successfully installed on your project."
  fi
}

function check_json_package {
  if [ ! -f "$PACKAGE_JSON_FILE" ]; then
    echo "❌ The package.json file was not found."
    exit 1
  fi
}

function check_which_framework {
  if grep -q "\"react\"" "$PACKAGE_JSON_FILE"; then
    echo "🆗 The detected framework is React."
    inject_dependencies_on_rect
  elif grep -q "\"@angular/core\"" "$PACKAGE_JSON_FILE"; then
    echo "🆗 The detected framework is Angular."
    inject_dependencies_on_angular
  else
    echo "❌ None of the 'React' or 'Angular' frameworks were detected."
  fi
}

function inject_dependencies_on_angular {
  cd "$CURRENT_PROJECT"
  touch script.js

  cat <<EOF > script.js
  const fs = require("fs");

  let projectName;
  const angularJsonPath = "angular.json";
  const packageJson = "package.json";
  const libraryPath = "src/saturn.css";
  let angularJsonContent = fs.readFileSync(angularJsonPath, "utf8");
  let angularJson = JSON.parse(angularJsonContent);

  function getProjectName() {
      try {
          const projectKeys = Object.keys(angularJson.projects);
          projectName = projectKeys[0];
          return projectName;
      } catch (error) {
          console.error("❌ An error occured while reading angular.json ", error);
          return projectName;
      }
  }

  if (projectName) {
      console.info(projectName);
  }

  function insertLibraryPath() {
      try {
          if (!projectName) {
              console.error("❌ Project name not found in angular.json");
              return;
          } else {
              console.info(`🆗 The project ${projectName} exists.`);
          }

          const injectPathToDependencies = angularJson.projects[projectName].architect.build.options.styles;

          if (injectPathToDependencies[0] !== libraryPath) {
              injectPathToDependencies.unshift(libraryPath);
              fs.writeFileSync(angularJsonPath, JSON.stringify(angularJson, null, 2));
              console.info("🆗 The library has been successfully added to the dependencies.");
          } else {
              console.info("🆗 The library is already in the dependencies.");
          }
      } catch (error) {
          console.error("❌ An error occured while reading/writing angular.json.");
      }
  }

  getProjectName();
  insertLibraryPath();
EOF

  node "$SCRIPT_JS"
}

function inject_dependencies_on_rect {
  cd "$CURRENT_PROJECT"
  touch script.js

  cat <<EOF > script.js
  import fs from "fs";

  const reactJSXPath = "./src/main.jsx";
  const libraryPath = 'import "./saturn.css";';

  function insertLibraryPath() {
      try {
          let reactJSXContent = fs.readFileSync(reactJSXPath, "utf8");
          if (!reactJSXContent.includes(libraryPath)) {
              reactJSXContent = libraryPath + "\n" + reactJSXContent;
              fs.writeFileSync(reactJSXPath, reactJSXContent);
              console.info("🆗 The library has been added to dependencies.");
          } else {
              console.info("🆗 The library is already in the dependencies.");
          }
      } catch (error) {
          console.error("❌ An error occured while reading/writing main.jsx ", error);
      }
  }

  insertLibraryPath();
EOF

  node "$SCRIPT_JS"
}

function destroying_unnecessary_files {
  echo "🆗 Cleaning and deleting unnecessary files."
  rm -rf "$SCRIPT_JS"
  echo "✔️ The library is correctly installed."
}

move_style_file_on_project
check_json_package
check_which_framework
destroying_unnecessary_files
