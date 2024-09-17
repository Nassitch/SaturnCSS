const fs = require("fs");

const jsonPackagePath = "../../package.json";
const packageJson = require(jsonPackagePath);
const scriptPath = "sh node_modules/saturn-css/script.sh";

packageJson.script.saturn = scriptPath;

if (packageJson.script.saturn) {
    fs.writeFileSync(jsonPackagePath, JSON.stringify(packageJson, null, 2));
} else {
    console.error("The property is non-existent.");
}

