const fs = require("fs");
const path = require("path");

function copyDir(src, dest) {
    // Create destination directory if it doesn't exist
    if (!fs.existsSync(dest)) {
        fs.mkdirSync(dest, { recursive: true });
    }

    // Read all entries in the source directory
    const entries = fs.readdirSync(src, { withFileTypes: true });

    // Iterate through each entry
    for (let entry of entries) {
        const srcPath = path.join(src, entry.name);
        const destPath = path.join(dest, entry.name);

        if (entry.isDirectory()) {
            // Recursively copy subdirectories
            copyDir(srcPath, destPath);
        } else {
            // Copy files
            fs.copyFileSync(srcPath, destPath);
        }
    }
}

// Copy assets folder to public/assets
console.log("Copying assets to public directory...");
console.log("Source directory exists:", fs.existsSync("assets"));
console.log("Public directory exists:", fs.existsSync("public"));

copyDir("assets", "public/assets");

console.log("Checking if files were copied...");
console.log("public/assets exists:", fs.existsSync("public/assets"));
console.log("public/assets/css exists:", fs.existsSync("public/assets/css"));

if (fs.existsSync("public/assets/css")) {
    const cssFiles = fs.readdirSync("public/assets/css");
    console.log("CSS files in public/assets/css:", cssFiles);
}

console.log("Assets copied successfully!");
