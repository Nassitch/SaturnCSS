const fs = require("fs");

const jsonPackagePath = "../../package.json";
const packageJson = require(jsonPackagePath);
const scriptPath = "sh node_modules/saturn-css/script.sh";
const saturn = "saturn-css";

delete packageJson.scripts.saturn;
delete packageJson.scripts[saturn];

packageJson.scripts[saturn] = scriptPath;

if (packageJson.scripts[saturn]) {
    fs.writeFileSync(jsonPackagePath, JSON.stringify(packageJson, null, 2));
} else {
    console.error("The property is non-existent.");
}

